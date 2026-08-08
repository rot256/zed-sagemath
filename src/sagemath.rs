use zed_extension_api::{self as zed, settings::LspSettings, LanguageServerId, Result};

struct SageMathExtension;

impl zed::Extension for SageMathExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let settings = LspSettings::for_worktree(language_server_id.as_ref(), worktree).ok();
        let binary = settings.and_then(|settings| settings.binary);
        let args = binary
            .as_ref()
            .and_then(|binary| binary.arguments.clone())
            .unwrap_or_default();
        let mut env = binary
            .as_ref()
            .and_then(|binary| binary.env.clone())
            .unwrap_or_default();
        for (key, value) in worktree.shell_env() {
            env.entry(key).or_insert(value);
        }
        let path = binary
            .and_then(|binary| binary.path)
            .or_else(|| worktree.which("sagelsp"))
            .ok_or_else(|| {
                "sagelsp not found on PATH. Install it with `pip install sage-lsp`.".to_string()
            })?;

        Ok(zed::Command {
            command: path,
            args,
            env: env.into_iter().collect(),
        })
    }
}

zed::register_extension!(SageMathExtension);
