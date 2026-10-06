# find_longest_consecutive_subsequence

You are assigned the task of creating a function to identify the longest consecutive subsequence within an unsorted list of integers. A consecutive subsequence is defined as a sequence of numbers where each number follows the previous one without any gaps. Your solution should be efficient, aiming for a time complexity of O(n).

Your task is to implement the function `find_longest_consecutive_subsequence(nums)` which finds the longest consecutive subsequence in a list.

Parameters:
- `nums` (List[int]): A list of integers which can be both positive and negative, and may contain duplicates.

Returns:
- int: The length of the longest consecutive subsequence found within the list.

For instance, given the list `[100, 4, 200, 1, 3, 2]`:
- The longest consecutive subsequence is `[1, 2, 3, 4]`, so the function should return 4.

Another example, for the list `[9, 1, -3, -2, 0, -1, 11, 12, 13, 10]`:
- The longest consecutive subsequence is `[-3, -2, -1, 0, 1]`, and the function should return 5.

Ensure that your implementation correctly handles edge cases such as an empty list, where the longest consecutive subsequence length should be 0. 

Here are the steps to guide your implementation:
1. Use a set to store the elements of the input list to allow O(1) look-up times.
2. Iterate through each element of the set, initiating a search for the start of a potential sequence (a number where `num-1` is not in the set).
3. For each start of a sequence, determine its length by checking the presence of consecutive numbers.
4. Track and update the max length of the sequences found.

Example:
- `find_longest_consecutive_subsequence([100, 4, 200, 1, 3, 2]) == 4`

Implement `find_longest_consecutive_subsequence(nums: list[int]) -> int`.
