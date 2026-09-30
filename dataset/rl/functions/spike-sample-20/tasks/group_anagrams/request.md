# Group anagrams

Implement `group_anagrams(words: list[str]) -> list[list[str]]`. Put words that
are anagrams of each other (same letters, same counts; case-sensitive) in the same
group. Sort the words inside each group alphabetically, then sort the groups by
their first word.

Example:
- `group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]) == [["ate", "eat", "tea"], ["bat"], ["nat", "tan"]]`
