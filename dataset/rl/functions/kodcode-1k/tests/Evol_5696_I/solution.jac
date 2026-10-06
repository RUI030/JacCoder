import re;
import from collections { defaultdict }
"""
    Returns a map where each word is a key and the value is the number of times that word appears in the string.
    Ignores case sensitivity and punctuation.
    """
def word_count(s: str) -> dict[str, int] {
    words = re.findall(r'\b\w+\b', s.lower());
    word_map = defaultdict(int);
    for word in words {
        word_map[word] += 1;
    }
    return `dict(word_map);
}

