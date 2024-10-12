# Zed SageMath

Adds support for [SageMath](https://www.sagemath.org/) in the [Zed text editor](https://zed.dev/).

## Limitations

Currently, the [Tree Sitter Grammar is simply Python](https://github.com/tree-sitter/tree-sitter-python).
Additionally, the Python language servers do not work with SageMath.
In the future I hope to add a SageMath grammar and language server:

- Support Sage-specific syntax (e.g. `P.<x,y> = PolynomialRing(QQ)`).
- Explore if rewriting the Sage-specific expressions to Python and using a Python language server is feasible.

## Contributing

If you would like to contribute, please open an issue to discuss or pull request.

All contributions must be made under the MIT License.
