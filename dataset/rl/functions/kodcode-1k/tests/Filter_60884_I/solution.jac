"""
    Extracts the year from a date string in the format 'YYYY-MM-DD'.

    Parameters:
    date_string (str): A date string in the format 'YYYY-MM-DD'

    Returns:
    int: The year extracted from the date string
    """
def extract_year(date_string: str) -> int {
    year = date_string.split('-')[0];
    return int(year);
}

