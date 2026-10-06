"""
    Validates the given password according to specific rules:
    - At least 8 characters long
    - Contains at least one uppercase letter
    - Contains at least one lowercase letter
    - Contains at least one numerical digit
    - Contains at least one special character from the set !@#$%^&*()-_=+

    Parameters:
    password (str): The password string to validate

    Returns:
    str: "Password is valid" if the password meets all criteria, otherwise "Password is invalid"
    """
def validate_password(password: str) -> str {
    if (len(password) < 8) {
        return "Password is invalid";
    }
    has_upper = `any(char.isupper() for char in password);
    has_lower = `any(char.islower() for char in password);
    has_digit = `any(char.isdigit() for char in password);
    has_special = `any((char in "!@#$%^&*()-_=+") for char in password);
    if (has_upper and has_lower and has_digit and has_special) {
        return "Password is valid";
    } else {
        return "Password is invalid";
    }
}

