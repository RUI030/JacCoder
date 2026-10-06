# longest_beautiful_view

Determine the length of the longest beautiful view in the given skyline.
A beautiful view is defined as a contiguous subarray of the skyline such that
the heights of the buildings in the subarray first strictly increase to a peak 
and then strictly decrease.
Args:
heights (List[int]): An array representing the heights of the buildings in the skyline.

Returns:
int: The length of the longest beautiful view.

Examples:
>>> longest_beautiful_view([1, 2, 3, 4, 5, 3, 1])
7
>>> longest_beautiful_view([1, 1, 1, 1])
0

Implement `longest_beautiful_view(heights: list[int]) -> int`.
