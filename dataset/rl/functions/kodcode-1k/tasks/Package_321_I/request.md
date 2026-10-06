# convert_to_24_hour_format

You are asked to write a function named `convert_to_24_hour_format` that converts a given time in 12-hour AM/PM format to a 24-hour format. The input string will be in the format "hh:mm AM" or "hh:mm PM", where "hh" is the hour, "mm" is the minutes, "AM" and "PM" represent the time period.

Here's how to convert the time:

1. If the input time is in the "AM" period:
   - If the hour is 12 (for 12 AM), convert it to 00.
   - If the hour is any value other than 12, keep it as is.
2. If the input time is in the "PM" period:
   - If the hour is 12 (for 12 PM), keep it as 12.
   - If the hour is any value other than 12, add 12 to the hour value.

The function should take `time_12` as its parameter—a string representing time in the 12-hour AM/PM format—and return a string representing the time in the 24-hour format ("HH:MM").

Example:
- `convert_to_24_hour_format("02:45 PM")` should return `"14:45"`
- `convert_to_24_hour_format("12:00 AM")` should return `"00:00"`

Write the function `convert_to_24_hour_format(time_12)` to correctly perform this conversion.

Example:
- `convert_to_24_hour_format('02:45 PM') == '14:45'`

Implement `convert_to_24_hour_format(time_12: str) -> str`.
