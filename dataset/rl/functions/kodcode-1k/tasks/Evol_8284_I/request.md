# square_evens

Write a function that takes a list of integers and returns a new list that contains the squares of all the even numbers from the original list, arranged in the same order they appeared in the input list. Ensure that odd numbers are not included in the output list.

def square_evens(nums: list) -> list:
    """Takes a list of integers and returns a list containing squares of the even integers in the same order"""
    """
    >>> square_evens([1, 2, 3, 4, 5])
    [4, 16]
    >>> square_evens([10, 11, 12, 13])
    [100, 144]
    >>> square_evens([7, 8, 9, 14, 17])
    [64, 196]
    """

Example:
- `square_evens([1, 2, 3, 4, 5]) == [4, 16]`

Implement `square_evens(nums: list[int]) -> list[int]`.
