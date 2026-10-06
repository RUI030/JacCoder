import from collections { defaultdict }
"""
    Returns a list of lists, where each inner list contains anagrams from the input list of words.
    """
def group_anagrams(words: list[str]) -> list[list[str]] {
    anagrams = defaultdict(`list);
    for word in words {
        sorted_word = ''.join(sorted(word));
        anagrams[sorted_word].append(word);
    }
    return `list(anagrams.values());
}

