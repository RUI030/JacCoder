"""
    Compresses a string such that consecutive identical characters are replaced
    by the character followed by the count of occurrences. Single occurrence does
    not show the count.

    Args:
    s (str): Input string consisting of lowercase Latin letters

    Returns:
    str: Compressed string
    """
def compress_string(s: str) -> str {
    if not s {
        return "";
    }
    compressed = [];
    count = 1;
    prev_char = s[0];
    for i in range(1, len(s)) {
        if (s[i] == prev_char) {
            count += 1;
        } else {
            if (count > 1) {
                compressed.append(f"{prev_char}{count}");
            } else {
                compressed.append(prev_char);
            }
            prev_char = s[i];
            count = 1;
        }
    }
    if (count > 1) {
        compressed.append(f"{prev_char}{count}");
    } else {
        compressed.append(prev_char);
    }
    return ''.join(compressed);
}

