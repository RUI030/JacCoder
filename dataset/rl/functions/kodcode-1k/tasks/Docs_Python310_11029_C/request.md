# process_strings

Take a list of strings containing mathematical expressions, evaluate each expression, 
and return a list of strings formatted as "expression = result", with results formatted 
to two decimal places if they are float.

Examples:
>>> process_strings(["2 + 2", "5 - 3*2", "(8 / 4) + 4", "7 * 3 + 1"])
["2 + 2 = 4", "5 - 3*2 = -1", "(8 / 4) + 4 = 6.00", "7 * 3 + 1 = 22"]

>>> process_strings(["10 / 3", "2 * 2 + 3", "(10 - 5) * 2"])
["10 / 3 = 3.33", "2 * 2 + 3 = 7", "(10 - 5) * 2 = 10"]

Implement `process_strings(string_list: list[str]) -> list[str]`.
