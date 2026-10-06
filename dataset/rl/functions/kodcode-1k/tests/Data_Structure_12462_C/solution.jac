def word_pattern(pattern: str, input_string: str) -> bool {
    words = input_string.split();
    if (len(pattern) != len(words)) {
        return False;
    }
    char_to_word = {};
    word_to_char = {};
    for (p, w) in zip(pattern, words) {
        if ((p in char_to_word) and (char_to_word[p] != w)) {
            return False;
        }
        if ((w in word_to_char) and (word_to_char[w] != p)) {
            return False;
        }
        char_to_word[p] = w;
        word_to_char[w] = p;
    }
    return True;
}

