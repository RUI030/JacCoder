# optimized_interpolation_search

Enhanced interpolation search to handle edge cases and optimize performance.

Parameters:
array (List[int]): A sorted list of integers.
search_key (int): The key to search for.

Returns:
int: The index of search_key if found, else -1.

Examples:
>>> optimized_interpolation_search([-25, -12, -1, 10, 12, 15, 20, 41, 55], -1)
2
>>> optimized_interpolation_search([5, 10, 12, 14, 17, 20, 21], 55)
-1

Implement `optimized_interpolation_search(array: list[int], search_key: int) -> int`.
