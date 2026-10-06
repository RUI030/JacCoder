"""
    Process the input string s according to the specified rules:
    - Remove all vowels and digits.
    - Insert a character "." before each remaining consonant.
    - Replace all uppercase consonants with corresponding lowercase ones.
    """
def process_string(s: str) -> str {
    vowels = `set("aoyeuiAOYEUI");
    result = "";
    for char in s {
        if (char.isdigit() or (char in vowels)) {
            continue;
        }
        if (char.isalpha() and (char not in vowels)) {
            result += '.' + char.lower();
        }
    }
    return result;
}

