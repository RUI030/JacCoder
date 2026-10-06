"""
    Removes duplicate words, retains only the first occurrence, sorts unique
    words alphabetically, and returns them as a single string in lowercase.
    """
def process_string(s: str) -> str {
    words = s.lower().split();
    unique_words = [];
    seen_words = `set();
    for word in words {
        if (word not in seen_words) {
            seen_words.add(word);
            unique_words.append(word);
        }
    }
    unique_words.sort();
    return " ".join(unique_words);
}

