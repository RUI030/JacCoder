# find_unique_pairs

Write a function that takes an array of integers and a target integer value. 
The function should return all unique pairs of integers from the array that sum 
up to the target value. The pairs should be returned as a list of tuples, where each tuple contains exactly two integers.

>>> find_unique_pairs([1, 2, 3, 4, 5], 5)
[(1, 4), (2, 3)]
>>> find_unique_pairs([3, 1, 4, 1, 5], 6)
[(1, 5)]

Implement `find_unique_pairs(nums: list[int], target: int) -> list[tuple[int, int]]`.
