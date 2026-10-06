# find_anagram_pairs

Create a Jac function called `find_anagram_pairs` that takes a list of strings and returns a list of pairs of indices representing the positions of the anagram pairs within the input list.

Your function `find_anagram_pairs(words)` should:
1. Identify anagram pairs within the provided list of strings.
2. Return a list of tuples, where each tuple represents the indices of two strings that are anagrams of each other.

For example, calling `find_anagram_pairs(["listen", "silent", "enlist", "google", "gooegl"])` should return `[(0, 1), (0, 2), (1, 2), (3, 4)]` because:
- "listen" and "silent" are anagrams and are at indices 0 and 1.
- "listen" and "enlist" are anagrams and are at indices 0 and 2.
- "silent" and "enlist" are anagrams and are at indices 1 and 2.
- "google" and "gooegl" are anagrams and are at indices 3 and 4.

Requirements:
- The function should consider each pair of words only once; hence, if (i, j) is in the output, (j, i) should not be.
- Words are case-insensitive, meaning "Listen" and "Silent" should be treated as anagrams.

Write the function following the above requirements.

Example:
- `find_anagram_pairs(['apple', 'banana', 'cherry']) == []`

Implement `find_anagram_pairs(words: list[str]) -> list[tuple[int, int]]`.
