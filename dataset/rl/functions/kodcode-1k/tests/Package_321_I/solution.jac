"""
    Converts a given time in 12-hour AM/PM format to a 24-hour format.

    Parameters:
    time_12 (str): Time in 12-hour AM/PM format ("hh:mm AM" or "hh:mm PM")

    Returns:
    str: Time in 24-hour format ("HH:MM")
    """
def convert_to_24_hour_format(time_12: str) -> str {
    (time, period) = time_12.split();
    (hours, minutes) = map(int, time.split(':'));
    if (period == "AM") {
        if (hours == 12) {
            hours = 0;
        }
    } elif (hours != 12) {
        hours += 12;
    }
    return f"{hours:02}:{minutes:02}";
}

