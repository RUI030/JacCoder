"""
    Remove all characters from the sentence except letters (a-z, A-Z).
    """
def remove_non_letters(sentence: str) -> str {
    return ''.join(
        char
        for char in sentence
        if char.isalpha()
    );
}

