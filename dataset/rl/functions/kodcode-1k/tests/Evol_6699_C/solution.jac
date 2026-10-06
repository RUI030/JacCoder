"""
    Reverses the words in the given sentence without altering the word order.
    Reduces multiple spaces to a single space in the output.
    """
def reverse_words(sentence: str) -> str {
    result = [];
    word = [];
    i = 0;
    length = len(sentence);
    while (i < length) {
        if (sentence[i] != ' ') {
            word.append(sentence[i]);
        } elif word {
            result.append(''.join(word));
            word = [];
        }
        i += 1;
    }
    if word {
        result.append(''.join(word));
    }
    return ' '.join(result);
}

