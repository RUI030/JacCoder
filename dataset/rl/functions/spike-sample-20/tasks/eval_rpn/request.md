# Evaluate Reverse Polish Notation

Implement `eval_rpn(tokens: list[str]) -> int`. Tokens are integers (possibly
negative, like `"-3"`) or the operators `+ - * /`. Division truncates toward zero
(so `7 / -2` is `-3`). The expression is always valid.

Example:
- `eval_rpn(["2", "1", "+", "3", "*"]) == 9`
