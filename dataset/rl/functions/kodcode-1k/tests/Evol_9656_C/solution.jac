"""
    Given a list of words, returns a list of words with all vowels removed.

    :param words: List of words to process
    :return: List of words with vowels removed
    """
def remove_vowels(words: list[str]) -> list[str] {
    vowels = "aeiou";
    result = [];
    for word in words {
        no_vowel_word = "".join(
            char
            for char in word
            if (char not in vowels)
        );
        result.append(no_vowel_word);
    }
    return result;
}

