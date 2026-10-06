# count_good_strings

You are given an array of strings `words` and a string `chars`. A string from `words` is considered "good" if it can be formed by characters from `chars` (each character can only be used once in `chars`). Return the sum of the lengths of all "good" strings in `words`. You must write an efficient algorithm that solves the problem in `O(n)` time complexity, where `n` is the number of characters in `words`.

Example:
- `count_good_strings(['cat', 'bt', 'hat', 'tree'], 'atach') == 6`

Implement `count_good_strings(words: list[str], chars: str) -> int`.
