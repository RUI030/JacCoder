# next_greater_element

Finds the next greater element for each element in nums2 within nums1.

Args:
    nums1: A list of integers where nums2 is a subset of nums1.
    nums2: A list of integers that is a subset of nums1.

Returns:
    A list of integers where each element in nums2 is replaced by its next greater element in nums1.
    If there is no greater element, -1 is returned for that element.

Examples:
    >>> next_greater_element([4, 1, 2], [1, 2])
    [2, -1]
    >>> next_greater_element([4, 1, 2], [2])
    [-1]

Implement `next_greater_element(nums1: list[int], nums2: list[int]) -> list[int]`.
