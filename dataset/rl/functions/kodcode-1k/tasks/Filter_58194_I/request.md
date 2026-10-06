# convert_to_percent

Write a Jac function `convert_to_percent` that takes a float or integer representing a fraction and converts it to a percentage string. The function should handle numbers between 0 and 1, as well as numbers greater than 1. The output should be a string with two decimal places followed by the percent sign (%). For numbers greater than 1, it should first convert them to a fraction by dividing by 100 before converting to a percentage.

Example:
- `convert_to_percent(0.5) == '50.00%'`

Implement `convert_to_percent(value: float) -> str`.
