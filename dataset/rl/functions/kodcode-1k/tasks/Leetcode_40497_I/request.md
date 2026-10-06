# reorder_to_standard_lexicographical

You are given a string `order` and an array of strings `words`. `order` is a permutation of the lowercase English letters. Whole array of `words` is sorted according to the order defined by the string `order`. Your task is to reorder the array of strings in `words` according to the standard lexicographical order (i.e., dictionary order). Return the reordered array of strings.

Example:
- `reorder_to_standard_lexicographical('abcdefghijklmnopqrstuvwxyz', ['word', 'apple', 'hero']) == ['apple', 'hero', 'word']`

Implement `reorder_to_standard_lexicographical(order: str, words: list[str]) -> list[str]`.
