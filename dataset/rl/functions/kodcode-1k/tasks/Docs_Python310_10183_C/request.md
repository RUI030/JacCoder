# transform_and_filter

Perform a series of array manipulations including sorting, filtering, and transformation.

Args:
nums (List[int]): A list of integers.

Returns:
List[int]: A list of sorted integers where:
    1. The number is positive.
    2. The number is even.
    3. Each number is squared.

>>> transform_and_filter([4, -3, 2, -1, 0, 5, 8, 10])
[4, 16, 64, 100]
>>> transform_and_filter([3, 1, 7, 6, -6, 14, 9, 0])
[36, 196]

Implement `transform_and_filter(nums: list[int]) -> list[int]`.
