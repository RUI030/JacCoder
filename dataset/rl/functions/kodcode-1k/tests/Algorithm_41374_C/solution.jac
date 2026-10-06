import from typing { List }
"""
    Returns a list of words from the original list that start with the given target character.
    The function is case-insensitive.
    """
def words_starting_with(words: list[str], target: str) -> list[str] {
    target = target.lower();
    return [
        word
        for word in words
        if word.lower().startswith(target)
    ];
}

