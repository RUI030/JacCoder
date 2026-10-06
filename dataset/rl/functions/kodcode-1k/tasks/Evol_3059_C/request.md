# evaluate_expressions

Evaluates a list of arithmetic expressions.
Parameters:
- expressions (List[str]): A list of strings where each string is an arithmetic expression.

Returns:
- List[Union[float, str]]: List of evaluation results or "ERROR" for invalid expressions.

>>> evaluate_expressions(["2+3", "4-5", "6*7", "8/4", "10/0", "2**3", "5 +"])
[5, -1, 42, 2.0, "ERROR", "ERROR", "ERROR"]
>>> evaluate_expressions(["20 / 4", "3 * 7", "5 - 7", "2 + 2"])
[5.0, 21, -2, 4]

Implement `evaluate_expressions(expressions: list[str]) -> list[float | str]`.
