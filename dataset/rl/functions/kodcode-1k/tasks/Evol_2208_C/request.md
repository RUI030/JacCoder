# validate_hex_colors

Validates each string in the color_list to check if it is a proper hexadecimal color code.
Returns a list of tuples with the original string and a boolean indicating its validity.

>>> validate_hex_colors(['#123', '#abc'])
[('#123', True), ('#abc', True)]

>>> validate_hex_colors(['#112233', '#A3E2F7'])
[('#112233', True), ('#A3E2F7', True)]

Implement `validate_hex_colors(color_list: list[str]) -> list[tuple[str, bool]]`.
