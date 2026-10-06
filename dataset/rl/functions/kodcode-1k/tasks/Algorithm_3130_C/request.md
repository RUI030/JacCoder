# convert_to_24_hour_format

Converts a 12-hour time format string to a 24-hour time format string.

Args:
time_str (str): A string representing the time in 12-hour format with AM/PM.

Returns:
str: A string representing the time in 24-hour format.

Examples:
>>> convert_to_24_hour_format("02:30 PM") == "14:30"
>>> convert_to_24_hour_format("11:45 AM") == "11:45"

Implement `convert_to_24_hour_format(time_str: str) -> str`.
