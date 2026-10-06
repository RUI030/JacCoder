# levenshtein_distance

You are tasked with implementing a function to calculate the Levenshtein distance between two strings. The Levenshtein distance is a measure of the minimum number of single-character edits (insertions, deletions, or substitutions) required to change one string into another.

Implement the function `levenshtein_distance(s1: str, s2: str) -> int`. This function should:

- Accept two input strings, `s1` and `s2`.
- Use dynamic programming to calculate the Levenshtein distance.
- Initialize a matrix where the cell in row `i` and column `j` represents the Levenshtein distance between the first `i` characters of `s1` and the first `j` characters of `s2`.
- Populate this matrix using the recurrence relation:
  - `D[i, j] = D[i-1, j] + 1` if `i > 0` (deletion)
  - `D[i, j] = D[i, j-1] + 1` if `j > 0` (insertion)
  - `D[i, j] = D[i-1, j-1] + cost` where `cost = 0` if `s1[i-1] == s2[j-1]` else `cost = 1` (substitution)
- Return the value in the bottom-right cell of the matrix, which represents the Levenshtein distance between the entire strings `s1` and `s2`.

Ensure your implementation efficiently handles edge cases, such as empty strings or strings of significantly different lengths.

Example:
- `levenshtein_distance('kitten', 'kitten') == 0`

Implement `levenshtein_distance(s1: str, s2: str) -> int`.
