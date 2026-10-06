"""
    Returns True if the provided year is a leap year, False otherwise.
    """
def is_leap_year(year: int) -> bool {
    if ((((year % 4) == 0) and ((year % 100) != 0)) or ((year % 400) == 0)) {
        return True;
    } else {
        return False;
    }
}

