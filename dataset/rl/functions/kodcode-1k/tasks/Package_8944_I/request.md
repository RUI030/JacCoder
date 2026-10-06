# min_palindrome_cuts

### Problem: Palindrome Partitioning

You are asked to implement a function that determines the minimum number of cuts needed to partition a given string such that each substring is a palindrome. A palindrome is a string that reads the same backward as forward.

### Function Specification

Create a function named `min_palindrome_cuts` with the following specifications:

- **Inputs**:
  - `s`: a string representing the input word to be partitioned
  
- **Output**:
  - The function returns an integer representing the minimum number of cuts needed for the entire string to be split into palindromic substrings.

### Details

1. If the entire string `s` is already a palindrome, the function should return `0`.
2. Otherwise, the function should compute the minimum number of cuts required to partition the string into palindromic substrings.

### Examples

Example 1:
  - **Input**: `s = "aab"`
  - **Output**: `1`
  - **Explanation**: The palindrome partitioning ("aa", "b") involves 1 cut.

Example 2:
  - **Input**: `s = "racecar"`
  - **Output**: `0`
  - **Explanation**: The input string is already a palindrome, so no cuts are needed.

Example 3:
  - **Input**: `s = "banana"`
  - **Output**: `1`
  - **Explanation**: The palindrome partitioning ("b", "anana") involves 1 cut.

### Requirements

To solve the problem, you can utilize:
- Dynamic programming to keep track of minimum cuts needed.
- A helper function to check if a substring is a palindrome.

Ensure optimal performance to handle larger strings efficiently.

Implement the function `min_palindrome_cuts(s)` to satisfy the above scenarios.

Example:
- `min_palindrome_cuts('aab') == 1`

Implement `min_palindrome_cuts(s: str) -> int`.
