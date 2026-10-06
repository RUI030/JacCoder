import re;
"""
    Checks if the provided string is a palindrome, ignoring case sensitivity and non-alphanumeric characters.

    Args:
    input_str (str): The string to check.

    Returns:
    bool: True if the string is a palindrome, False otherwise.
    """
def is_palindrome(input_str: str) -> bool {
    cleaned_str = re.sub(r'[^A-Za-z0-9]', '', input_str).lower();
    return (cleaned_str == cleaned_str[::-1]);
}

with entry {
    if (__name__ == "__main__") {
        user_input = input("Enter a string to check if it is a palindrome: ");
        if is_palindrome(user_input) {
            print("The string is a palindrome.");
        } else {
            print("The string is not a palindrome.");
        }
    }
}

