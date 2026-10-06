# translate_to_morse

Design a Jac function to translate an input plaintext phrase to Morse code. For this task, use the following mapping of letters and digits to Morse code:

A: .-    B: -...  C: -.-.  D: -..   E: .    F: ..-.  G: --.   H: ....  I: ..   J: .---  K: -.-   L: .-..  M: --    N: -.    O: ---   P: .--.  Q: --.-  R: .-.   S: ...   T: -    U: ..-   V: ...-  W: .--   X: -..-  Y: -.--  Z: --..
0: -----  1: .----  2: ..---  3: ...--  4: ....-  5: .....  6: -....  7: --...  8: ---..  9: ----.

The function should conform to these specifics:
1. Non-alphanumeric characters (including spaces) are not encoded and should be replaced by a forward slash ( / ) in the output.
2. Each encoded character should be separated by a single space.
3. The function should be case insensitive (i.e., both 'a' and 'A' should be encoded as .-).

**Example Input:**
plaintext = "Hello World 123"

**Example Output:**
.... . .-.. .-.. --- / .-- --- .-. .-.. -.. / .---- ..--- ...--

Write the function `translate_to_morse(plaintext)` to accomplish the described translation.

Example:
- `translate_to_morse('Hello World 123') == '.... . .-.. .-.. --- / .-- --- .-. .-.. -.. / .---- ..--- ...--'`

Implement `translate_to_morse(plaintext: str) -> str`.
