# lexical_analyzer

Processes a given string of Jac code and returns a list of tokens based on Python's lexical analysis rules.
The tokens include identifiers, keywords, numeric literals (integers and floats), and basic operators (+, -, *, /, %, ==, !=, <, >, <=, >=).

>>> lexical_analyzer("x = 10 + 20")
[('identifier', 'x'), ('operator', '='), ('integer', '10'), ('operator', '+'), ('integer', '20')]
>>> lexical_analyzer("if count >= 10:")
[('keyword', 'if'), ('identifier', 'count'), ('operator', '>='), ('integer', '10'), ('operator', ':')]

Implement `lexical_analyzer(code_string: str) -> list[tuple[str, str]]`.
