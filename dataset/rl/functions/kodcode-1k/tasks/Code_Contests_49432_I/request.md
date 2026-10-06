# process_string

Petya's friend Vasya decided to challenge Petya by extending the previous task. This time, Petya needs to consider not only Latin letters but also digits. The program should perform the following operations on the given string:

- For all vowels and digits, remove them from the string.
- For all consonants, insert a character "." before each one.
- Replace all uppercase consonants with corresponding lowercase ones.

Vowels are still "A", "O", "Y", "E", "U", "I", and the rest are consonants. The digits are from "0" to "9". The program's input is exactly one string, and it should return the output as a single string, resulting after the program processes the initial string.

Input

The first line represents the input string of Petya's program. This string only consists of uppercase and lowercase Latin letters and digits, and its length is from 1 to 100, inclusive.

Output

Print the resulting string. It is guaranteed that this string is not empty.

Examples

Input

t0u1r


Output

.t.r


Input

Codeforc3s2021


Output

.c.d.f.r.c.s


Input

aBAcAba7


Output

.b.c.b

Example:
- `process_string('t0u1r') == '.t.r'`

Implement `process_string(s: str) -> str`.
