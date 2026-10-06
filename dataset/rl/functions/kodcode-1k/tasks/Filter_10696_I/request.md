# collapse_intervals

I have a vector of integers that contains several blocks of sequential integers. My task is to write a function that takes this vector and returns a vector of strings where each string represents a collapsed version of the sequential integers in the input vector. For example, given the input `[1, 2, 3, 5, 6, 9, 10, 11, 12]`, the output should be `["1->3", "5->6", "9->12"]`.

Example:
- `collapse_intervals([1, 2, 3, 5, 6, 9, 10, 11, 12]) == ['1->3', '5->6', '9->12']`

Implement `collapse_intervals(lst: list[int]) -> list[str]`.
