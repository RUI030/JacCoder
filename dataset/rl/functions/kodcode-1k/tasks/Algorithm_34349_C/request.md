# encode_morse

Encode a given string into its Morse code equivalent.
Morse code is a method used in telecommunication to encode text characters as standardized sequences of two different signal durations, dots and dashes.
Each Morse code letter or digit should be separated by a single space. There should be a triple space between Morse codes of separate words.

'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-',
'Y': '-.--', 'Z': '--..',
'0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-', 
'5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.'.

Example:
>>> encode_morse("HELLO WORLD")
".... . .-.. .-.. ---   .-- --- .-. .-.. -.."
>>> encode_morse("123")
".---- ..--- ...--"

Implement `encode_morse(message: str) -> str`.
