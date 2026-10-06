# first_unique_char_optimized

### Scenario
You are working on a text processing module that needs to identify the first non-repeating character in various strings provided by users. Efficiently identifying such characters will help in various text analysis tasks, such as frequency analysis and unique element identification in large text datasets.

### Task

Write a function `first_unique_char_optimized(s)` that improves on the time complexity of the provided algorithm to find the index of the first non-repeating character in a given string. Your solution should be efficient and handle large inputs gracefully.

### Input and Output Formats

* **Input**: A string `s` which consists of lowercase English letters.
* **Output**: Return the index of the first non-repeating character. If it doesn't exist, return -1.

### Constraints
* \(1 \leq \text{length of } s \leq 10^5\)

### Examples
1. Input: `s = "leetcode"`
   Output: `0`
2. Input: `s = "loveleetcode"`
   Output: `2`
3. Input: `s = "aabb"`
   Output: `-1`

### Performance Requirements
* Your implementation should aim for a time complexity of \(O(n)\) where \(n\) is the length of the string.
* The space complexity should also be kept as low as possible, preferably \(O(1)\) additional space, not counting the input string.

Example:
- `first_unique_char_optimized('leetcode') == 0`

Implement `first_unique_char_optimized(s: str) -> int`.
