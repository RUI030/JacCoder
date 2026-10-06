# contain_string

You are given two strings `haystack` and `needle`. Your task is to implement the function `contain_string(haystack, needle)` which returns the index of the first occurrence of `needle` in `haystack`. If `needle` is not part of `haystack`, return -1.

### Input
* `haystack`: A non-empty string consisting of lowercase English letters.
* `needle`: A string that can be empty and consists of lowercase English letters.

### Output
* An integer representing the index of the first occurrence of `needle` in `haystack` or -1 if `needle` is not part of `haystack`.

### Constraints
1. The input strings can be up to 10^5 characters in length.
2. The search should be case-sensitive.

### Examples

1. **Input**: haystack = "hello", needle = "ll"  
   **Output**: 2

2. **Input**: haystack = "aaaaa", needle = "bba"  
   **Output**: -1

3. **Input**: haystack = "mississippi", needle = "issip"  
   **Output**: 4

4. **Input**: haystack = "hello", needle = ""  
   **Output**: 0

### Performance Requirements
* Aim to achieve a solution that works within reasonable time limits for large inputs.
* Consider edge cases and optimize for them within your implementation.

### Notes
* You are required to handle edge cases where `needle` is empty or larger than `haystack`.
* Use efficient string comparison practices to manage time complexity.

Example:
- `contain_string('hello', 'll') == 2`

Implement `contain_string(haystack: str, needle: str) -> int`.
