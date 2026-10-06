"""
    Determines if the given message follows the alternating digit-vowel pattern.

    Parameters:
    message (str): The encoded message to validate.

    Returns:
    bool: True if the message is valid, False otherwise.
    """
def is_valid_encoded_message(message: str) -> bool {
    vowels = "AEIOUaeiou";
    if ((len(message) % 2) != 0) {
        return False;
    }
    for i in range(len(message)) {
        if ((i % 2) == 0) {
            if not message[i].isdigit() {
                return False;
            }
        } elif (message[i] not in vowels) {
            return False;
        }
    }
    return True;
}

