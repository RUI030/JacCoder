# longest_consecutive_sequence

# Task
You are given an array of integers. Your task is to find the longest sequence of consecutive integers in the array.

A sequence of consecutive integers is defined as set of numbers where each number in the set is one more than the previous number. For example, in the array [1, 2, 3, 7, 8], the longest sequence of consecutive integers is [1, 2, 3].

# Example
For array `arr = [2, 6, 1, 9, 4, 5, 3]`, the output should be `6`.

The longest consecutive sequence is [1, 2, 3, 4, 5, 6].

# Input/Output

- `[input]` array of integers `arr`

 An array of integers with no particular order.
 
 
- `[output]` an integer

 The length of the longest consecutive sequence.

# Note
- If there are no consecutive integers in the array, the length of the longest sequence is 1 (since each individual number is a sequence of length 1).

Example:
- `longest_consecutive_sequence([2, 6, 1, 9, 4, 5, 3]) == 6`

Implement `longest_consecutive_sequence(arr: list[int]) -> int`.
