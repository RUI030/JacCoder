def word_frequency(text: str) -> dict[str, int] {
    counts: dict[str, int] = {};
    for raw in text.split() {
        word = raw.lower().strip(".,!?;:");
        if word {
            counts[word] = counts.get(word, 0) + 1;
        }
    }
    return counts;
}
