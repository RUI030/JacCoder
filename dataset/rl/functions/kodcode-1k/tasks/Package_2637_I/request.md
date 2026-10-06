# most_common_word

You are required to implement a function named `most_common_word()` in Python that takes a list of strings and returns the most frequently occurring word in the list. If there is a tie, return the word that comes first in alphabetical order. You are encouraged to use the `collections` module to simplify your task.

Here are the detailed requirements:
1. Define the function `most_common_word(word_list)`.
2. Within the function, use the `Counter` class from the `collections` module to count the occurrences of each word in the list.
3. Identify the maximum frequency among the counted words.
4. Extract all words that have the maximum frequency.
5. Sort these words alphabetically and return the first word from the sorted list.
6. Your function should handle an empty list by returning an empty string.

Use the `collections.Counter` class and its methods as described in the provided documentation snippets.

Example:
- `most_common_word(['apple']) == 'apple'`

Implement `most_common_word(word_list: list[str]) -> str`.
