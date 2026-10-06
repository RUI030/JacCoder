"""
    Returns a string with all repeating characters removed, keeping only the first instance of each character.
    """
def remove_repeats(input_string: str) -> str {
    seen = `set();
    output_string = [];
    for char in input_string {
        if (char not in seen) {
            seen.add(char);
            output_string.append(char);
        }
    }
    return ''.join(output_string);
}

