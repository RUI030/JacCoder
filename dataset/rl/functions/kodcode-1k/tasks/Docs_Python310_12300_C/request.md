# process_data

Processes the input string by parsing out numeric and alphabetic components,
summing the numeric components, and concatenating the alphabetic components.

Args:
input_string (str): The input string consisting of alternating numeric and alphabetic components.

Returns:
str: A formatted string "Sum: <total_sum>, Concatenated String: <concatenated_string>"

Examples:
>>> process_data("123abc456def")
'Sum: 579, Concatenated String: abcdef'

>>> process_data("10hi20bye30yes")
'Sum: 60, Concatenated String: hibyeyes'

Implement `process_data(input_string: str) -> str`.
