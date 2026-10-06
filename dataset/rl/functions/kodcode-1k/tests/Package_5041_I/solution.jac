"""
    Returns a list of tuples with indices representing anagram pairs.
    """
def find_anagram_pairs(words: list[str]) -> list[tuple[int, int]] {
    anagram_pairs = [];
    lowered_words = [word.lower() for word in words];
    for i in range(len(lowered_words)) {
        for j in range((i + 1), len(lowered_words)) {
            if (sorted(lowered_words[i]) == sorted(lowered_words[j])) {
                anagram_pairs.append((i, j));
            }
        }
    }
    return anagram_pairs;
}

