# group_anagrams

Write a function that accepts a list of strings `words` and returns a list of lists, 
where each inner list contains all anagrams from the input list. Each inner list should 
contain strings that are anagrams of each other, and the inner lists should be in no 
particular order. An anagram is a word or phrase formed by rearranging the letters of 
another, using all the original letters exactly once.

>>> group_anagrams(["bat", "tab", "cat", "act", "dog", "god"])
[['bat', 'tab'], ['cat', 'act'], ['dog', 'god']]
>>> group_anagrams([""])
[[""]]

Implement `group_anagrams(words: list[str]) -> list[list[str]]`.
