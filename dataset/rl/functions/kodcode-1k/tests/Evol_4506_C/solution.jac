"""
    Compresses the given string by replacing consecutive repeated characters with the character
    followed by the count of repetitions. If the compressed string is not shorter than the original
    string, return the original string.
    """
def compress_string(s: str) -> str {
    if not s {
        return s;
    }
    compressed = [];
    count = 1;
    for i in range(1, len(s)) {
        if (s[i] == s[(i - 1)]) {
            count += 1;
        } else {
            compressed.append((s[(i - 1)] + str(count)));
            count = 1;
        }
    }
    compressed.append((s[-1] + str(count)));
    compressed_str = ''.join(compressed);
    return compressed_str if (len(compressed_str) < len(s)) else s;
}

