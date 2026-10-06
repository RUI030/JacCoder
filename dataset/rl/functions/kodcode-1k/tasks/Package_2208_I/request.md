# reverse_words

You are working on a string manipulation problem. You need to implement a function that will reverse the words in a string but keep the characters within each word in the same order. Words are separated by spaces, and there can be multiple spaces between words.

Specifically, you need to implement a function named `reverse_words(s)` that:

- Takes one parameter:
  - `s`: the input string (a string)
- The function should return a new string with the words in reverse order and the characters within each word unchanged.
- The function should also ensure that multiple spaces between words are reduced to a single space in the returned string.

To solve this problem, you will:
1. Split the input string into words using spaces as separators.
2. Reverse the list of words.
3. Join the reversed list of words with a single space between them.
4. Return the resulting string.

### Test Cases
- `reverse_words("the sky is blue")` should return `"blue is sky the"`.
- `reverse_words("  hello world!  ")` should return `"world! hello"`.
- `reverse_words("a good  example")` should return `"example good a"`.

Example:
- `reverse_words('the sky is blue') == 'blue is sky the'`

Implement `reverse_words(s: str) -> str`.
