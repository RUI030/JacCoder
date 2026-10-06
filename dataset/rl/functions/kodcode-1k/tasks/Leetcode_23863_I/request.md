# longest_word

You are given a list of strings `words` where each string consists of lowercase English letters. Your task is to find a string `longest_word` that can be built one character at a time by other words in the list. If there is more than one possible longest word, return the lexicographically smallest one.

For example, if `words` = ["a", "banana", "app", "appl", "ap", "apply", "apple"], the valid longest word would be "apple", as every prefix ("a", "ap", "app", "appl", "apple") is in the list `words`.

Return the longest word found or an empty string if no such word exists.

Example:
- `longest_word(['a', 'banana', 'app', 'appl', 'ap', 'apply', 'apple']) == 'apple'`

Implement `longest_word(words: list[str]) -> str`.
