"""
    Reverses every other word in the given sentence.

    :param sentence: A string of words separated by spaces.
    :return: A modified sentence with every other word reversed.
    """
def reverseEveryOther(sentence: str) -> str {
    words = sentence.split();
    for i in range(len(words)) {
        if ((i % 2) == 1) {
            words[i] = words[i][::-1];
        }
    }
    return ' '.join(words);
}

