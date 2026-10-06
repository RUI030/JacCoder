with entry {
    MORSE_CODE_DICT = {
        'A': '.-',
        'B': '-...',
        'C': '-.-.',
        'D': '-..',
        'E': '.',
        'F': '..-.',
        'G': '--.',
        'H': '....',
        'I': '..',
        'J': '.---',
        'K': '-.-',
        'L': '.-..',
        'M': '--',
        'N': '-.',
        'O': '---',
        'P': '.--.',
        'Q': '--.-',
        'R': '.-.',
        'S': '...',
        'T': '-',
        'U': '..-',
        'V': '...-',
        'W': '.--',
        'X': '-..-',
        'Y': '-.--',
        'Z': '--..',
        '0': '-----',
        '1': '.----',
        '2': '..---',
        '3': '...--',
        '4': '....-',
        '5': '.....',
        '6': '-....',
        '7': '--...',
        '8': '---..',
        '9': '----.',
        ' ': '/',
        ',': '--..--',
        '.': '.-.-.-'
    };
}
"""
    Converts English text to Morse code using the MORSE_CODE_DICT.

    Parameters:
    text (str): The text to be converted to Morse code.

    Returns:
    str: The converted Morse code as a string.
    """
def text_to_morse(text: str) -> str {
    text = text.upper();
    morse_code = ' '.join(MORSE_CODE_DICT.get(char, '') for char in text);
    return morse_code;
}

