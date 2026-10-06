"""
    Returns True if string s is a pangram, otherwise False.
    """
def is_pangram(s: str) -> bool {
    alphabet_set = `set("abcdefghijklmnopqrstuvwxyz");
    characters_in_s = `set(s.replace(" ", "").lower());
    return alphabet_set.issubset(characters_in_s);
}

