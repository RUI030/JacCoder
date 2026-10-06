# text_to_morse

### Python Code to Convert Text to Morse Code
#### Overview

The goal of this project is to create a simple Jac program that can convert text to Morse code.

#### Requirements

*   The program should have a function to convert English text to Morse code.
*   The program should have a dictionary that maps English characters to Morse code characters.
*   The program should handle both uppercase and lowercase letters.
*   The program should handle numbers and special characters.
*   The program should be able to convert a sentence to Morse code.

#### Morse Code Mapping

Here is a dictionary that maps English characters to Morse code:

| English Character | Morse Code |
| --- | --- |
| A | `.-` |
| B | `-...` |
| C | `-.-.` |
| D | `-..` |
| E | `.` |
| F | `..-` |
| G | `--.` |
| H | `....` |
| I | `..` |
| J | `.--` |
| K | `-.-` |
| L | `.-..` |
| M | `--` |
| N | `-` |
| O | `---` |
| P | `.--.` |
| Q | `--.-` |
| R | `.-.` |
| S | `...` |
| T | `-` |
| U | `..-` |
| V | `...-` |
| W | `.--` |
| X | `-..-` |
| Y | `-.--` |
| Z | `--..` |
| 0 | `-----` |
| 1 | `·----` |
| 2 | `··---` |
| 3 | `···--` |
| 4 | `····-` |
| 5 | `·····` |
| 6 | `-····` |
| 7 | `--···` |
| 8 | `---··` |
| 9 | `----·` |
| space | `/` |
| , | `--..--` |
| . | `.-.-.-` |
|?

Example:
- `text_to_morse('A') == '.-'`

Implement `text_to_morse(text: str) -> str`.
