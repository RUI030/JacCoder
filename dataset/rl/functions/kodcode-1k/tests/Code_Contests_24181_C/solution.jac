"""
    Remove consecutive duplicate words from the sentence.
    """
def remove_consecutive_duplicates(s: str) -> str {
    words = s.split();
    if not words {
        return s;
    }
    result = [words[0]];
    for word in words[1:] {
        if (word != result[-1]) {
            result.append(word);
        }
    }
    return " ".join(result);
}

