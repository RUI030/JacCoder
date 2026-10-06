# process_string

Given a string of words separated by spaces, this function removes any duplicate words,
retaining only the first occurrence of each word, sorts the unique words in alphabetical
order, and returns the sorted words as a single string with words separated by spaces.

>>> process_string("apple banana Apple orange banana grapefruit banana Apple")
"apple banana grapefruit orange"
>>> process_string("Hello hello HELLO")
"hello"

Implement `process_string(s: str) -> str`.
