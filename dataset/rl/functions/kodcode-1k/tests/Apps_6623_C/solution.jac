def wordPattern(pattern: str, words: str) -> bool {
    word_list = words.split();
    if (len(pattern) != len(word_list)) {
        return False;
    }
    pattern_to_word = {};
    word_to_pattern = {};
    for (p, w) in zip(pattern, word_list) {
        if (p not in pattern_to_word) {
            if (w in word_to_pattern) {
                return False;
            }
            pattern_to_word[p] = w;
            word_to_pattern[w] = p;
        } elif (pattern_to_word[p] != w) {
            return False;
        }
    }
    return True;
}

