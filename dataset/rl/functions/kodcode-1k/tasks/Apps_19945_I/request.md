# three_sum

Write a function that takes as input a list of integers and an integer `T`. The function should return `True` if there are three distinct elements in the list that sum up to `T`, and `False` otherwise.

 

Example 1:
Input: nums = [12, 3, 6, 1, 6, 9], T = 24
Output: True
Explanation: The triplet (12, 3, 9) sums up to 24.

Example 2:
Input: nums = [1, 2, 3, 4, 5], T = 50
Output: False
Explanation: No triplet in the list sums up to 50.
 

Notes:
- The function should return a boolean value.
- The input list may have duplicate values but the function should consider only distinct elements for forming a triplet.
- The length of the list `nums` will be between 3 and 1000.
- Each element in the list `nums` will be between -1000 and 1000.

Example:
- `three_sum([12, 3, 6, 1, 6, 9], 24) == True`

Implement `three_sum(nums: list[int], T: int) -> bool`.
