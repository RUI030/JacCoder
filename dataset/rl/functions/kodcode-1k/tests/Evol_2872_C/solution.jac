"""
    Determines if the given string is a valid license plate number.

    A valid license plate must have:
    - Exactly 6 characters.
    - The first three characters should be uppercase letters (A-Z).
    - The last three characters should be digits (0-9).

    Args:
    plate (str): The string to check for validity.

    Returns:
    bool: True if the string is valid as a license plate, False otherwise.
    """
def is_valid_license_plate(plate: str) -> bool {
    if (len(plate) != 6) {
        return False;
    }
    if not (plate[:3].isupper() and plate[:3].isalpha()) {
        return False;
    }
    if not plate[3:].isdigit() {
        return False;
    }
    return True;
}

