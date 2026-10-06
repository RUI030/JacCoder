"""
    Returns the most frequent letter in the string. If there are multiple letters with the same highest frequency,
    returns the one that appears first in the string.
    """
def most_frequent_letter(s: str) -> str {
    frequency = {};
    max_freq = 0;
    most_freq_letter = '';
    for char in s {
        if char.isalpha() {
            if (char not in frequency) {
                frequency[char] = 0;
            }
            frequency[char] += 1;
            if (
                (frequency[char] > max_freq)
                or ((frequency[char] == max_freq) and (most_freq_letter == ''))
            ) {
                max_freq = frequency[char];
                most_freq_letter = char;
            }
        }
    }
    return most_freq_letter;
}

