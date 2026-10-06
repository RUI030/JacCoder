"""
    Translate the given plaintext string to Morse code.

    Parameters:
    plaintext (str): The input plaintext string to be translated.

    Returns:
    str: The translated Morse code.
    """
def translate_to_morse(plaintext: str) -> str {
    morse_code_dict = {
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
        '9': '----.'
    };
    translated = [];
    for char in plaintext.upper() {
        if (char in morse_code_dict) {
            translated.append(morse_code_dict[char]);
        } else {
            translated.append('/');
        }
    }
    return ' '.join(translated);
}

