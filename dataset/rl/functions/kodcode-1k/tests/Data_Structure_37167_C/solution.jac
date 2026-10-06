"""
    Uses the Rabin-Karp algorithm with a rolling hash to find the starting index
    of the first occurrence of the pattern in the text. Returns -1 if the pattern is not found.
    """
def find_pattern(pattern: str, text: str) -> int {
    if (not pattern or not text or (len(pattern) > len(text))) {
        return -1;
    }
    prime = 101;
    m = len(pattern);
    n = len(text);
    pattern_hash = 0;
    text_hash = 0;
    h = 1;
    for i in range((m - 1)) {
        h = (h * 256) % prime;
    }
    for i in range(m) {
        pattern_hash = ((256 * pattern_hash) + ord(pattern[i])) % prime;
        text_hash = ((256 * text_hash) + ord(text[i])) % prime;
    }
    for i in range(((n - m) + 1)) {
        if (pattern_hash == text_hash) {
            if (text[i:(i + m)] == pattern) {
                return i;
            }
        }
        if (i < (n - m)) {
            text_hash = (
                ((256 * (text_hash - (ord(text[i]) * h))) + ord(text[(i + m)])) % prime
            );
            if (text_hash < 0) {
                text_hash += prime;
            }
        }
    }
    return -1;
}

