"""
    This function reverses the order of the words in the given sentence,
    capitalizes the first letter of each word, and removes any extra spaces between words.

    Parameters:
    sentence (str): The input sentence containing words separated by spaces.

    Returns:
    str: The modified string with words reversed, capitalized, and extra spaces removed.
    """
def reverse_and_capitalize(sentence: str) -> str {
    words = sentence.split(' ');
    reversed_words = [];
    for word in words {
        if word.strip() {
            reversed_words.insert(0, word.strip().capitalize());
        }
    }
    return ' '.join(reversed_words);
}

