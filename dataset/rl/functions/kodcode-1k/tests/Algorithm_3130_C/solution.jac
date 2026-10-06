"""
    Converts a 12-hour time format string to a 24-hour time format string.

    Args:
    time_str (str): A string representing the time in 12-hour format with AM/PM.

    Returns:
    str: A string representing the time in 24-hour format.
    """
def convert_to_24_hour_format(time_str: str) -> str {
    (time, period) = time_str.split(' ');
    (hour, minute) = map(int, time.split(':'));
    if (period == "AM") {
        if (hour == 12) {
            hour = 0;
        }
    } elif (period == "PM") {
        if (hour != 12) {
            hour += 12;
        }
    }
    return f"{hour:02}:{minute:02}";
}

