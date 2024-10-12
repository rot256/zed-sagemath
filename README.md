# Zed SageMath

Adds support for SageMath in the Zed text editor.

## Limitations

Currently, the Tree Sitter Grammar is simply Python.
Additionally, the Python language servers do not work with SageMath.

In the future I hope to add a SageMath grammar and language server:

- Support Sage-specific syntax (e.g. `P.<x,y> = PolynomialRing(QQ)`).
- Explore if rewriting the Sage-specific expressions to Python and using a Python language server is feasible.
