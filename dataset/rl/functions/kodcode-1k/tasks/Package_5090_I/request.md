# roman_to_integer

You are tasked with writing a function `roman_to_integer(s)` that converts a Roman numeral to an integer. Roman numerals are represented by seven different symbols: `I`, `V`, `X`, `L`, `C`, `D`, and `M`.

Symbol       Value
I            1
V            5
X            10
L            50
C            100
D            500
M            1000

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not `IIII`. Instead, the number four is written as `IV`. There are six instances where subtraction is used:

- `I` can be placed before `V` (5) and `X` (10) to make 4 and 9.
- `X` can be placed before `L` (50) and `C` (100) to make 40 and 90.
- `C` can be placed before `D` (500) and `M` (1000) to make 400 and 900.

The function should take one parameter:

1. `s` (str): A string representing the Roman numeral.

The function should return an integer representing the converted Roman numeral.

### Usage Input/Output Example
For example, given the input `s = "MCMXCIV"`:
- The function call should look like `roman_to_integer("MCMXCIV")`
- The function should return `1994`

### Requirements:
- The function should be able to handle Roman numerals up to 3999.

### Constraints:
- The input string `s` is guaranteed to be a valid Roman numeral.
- The length of `s` is between 1 and 15.

Write the function `roman_to_integer(s)` that converts a given Roman numeral to an integer following the rules described above.

Example:
- `roman_to_integer('III') == 3`

Implement `roman_to_integer(s: str) -> int`.
