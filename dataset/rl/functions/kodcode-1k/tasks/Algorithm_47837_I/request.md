# reformat_sentence

### Scenario
Bob is working on reformatting sentences to meet specific styling requirements. He needs to ensure that each word in the sentence starts with a capital letter and that all words are separated by a single space. Help Bob by writing a function that takes a given string and returns it with the correct formatting.

### Coding Task
Write a function `reformat_sentence(sentence: str) -> str` that capitalizes the first letter of each word in the given string `sentence` and ensures there is exactly one space between each word.

### Input and Output Format
- **Input**:
  - `sentence` (a string consisting of alphanumeric characters, ',', '.', '!', and space, length 1 ≤ len(sentence) ≤ 1000)
- **Output**:
  - A string where each word's first letter is capitalized, with words separated by exactly one space.

### Constraints and Assumptions:
- The given string `sentence` will contain at least one word.
- The string can contain punctuation marks (.,!) which should not affect the capitalization of words.
- Multi-space sequences should be reduced to a single space.

### Example
- Example 1:
  - `sentence = "hello   world! how are you?"`
  - Output: `"Hello World! How Are You?"`

- Example 2:
  - `sentence = "   This is a  sample.  "
  - Output: `"This Is A Sample."`

**Note**: Pay special attention to leading and trailing spaces as well as sequences of multiple spaces.

Example:
- `reformat_sentence('hello   world! how are you?') == 'Hello World! How Are You?'`

Implement `reformat_sentence(sentence: str) -> str`.
