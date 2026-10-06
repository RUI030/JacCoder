"""
    Check if the input string is a valid sentence.

    Parameters:
    inputString (str): The sentence to check.

    Returns:
    bool: True if the input string is a valid sentence, False otherwise.
    """
def is_valid_sentence(inputString: str) -> bool {
    if not inputString[0].isupper() {
        return False;
    }
    if (
        not inputString.endswith(".")
        or ((len(inputString) > 1) and (inputString[-2] == " "))
    ) {
        return False;
    }
    sentence_body = inputString[:-1];
    words = sentence_body.split();
    for word in words {
        if not word.isalpha() {
            return False;
        }
    }
    return True;
}

