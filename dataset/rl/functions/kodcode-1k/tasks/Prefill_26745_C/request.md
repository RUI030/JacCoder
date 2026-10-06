# two_sum

Create a function that takes two parameters: a list of integers and a target integer. 
The function should return the indices of the two numbers such that the sum of those two numbers equals the target.
You should return the indices in an array format. If no such two numbers exist, return an empty array.

Args:
nums: List[int] - list of integers
target: int - target integer sum

Returns:
List[int] - list of indices of the two numbers that add up to target

>>> two_sum([2, 7, 11, 15], 9) == [0, 1]
>>> two_sum([3, 2, 4], 6) == [1, 2]

Implement `two_sum(nums: list[int], target: int) -> list[int]`.
