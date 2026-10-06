"""
    Returns a list of counts of consecutive identical characters in the string s.
    """
def consecutiveCounts(s: str) -> list[int] {
    if not s {
        return [];
    }
    counts = [];
    current_char = s[0];
    current_count = 1;
    for char in s[1:] {
        if (char == current_char) {
            current_count += 1;
        } else {
            counts.append(current_count);
            current_char = char;
            current_count = 1;
        }
    }
    counts.append(current_count);
    return counts;
}

