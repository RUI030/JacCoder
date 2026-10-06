# findPairs

Given a list of integers, your task is to write a function that identifies and returns all the pairs of distinct elements that sum up to a specific target value. The function should handle cases where multiple pairs can sum to the target value and ensure that each pair is unique.

The function `findPairs(nums, target)` should perform the following steps:

1. Accept a list of integers `nums` and an integer `target` as input parameters.
2. Initialize an empty set to store pairs of integers that sum up to the target.
3. Iterate through the list and use an auxiliary set to keep track of visited elements.
4. For each element in the list, calculate its complement value needed to reach the target.
5. Check if the complement value exists in the visited set.
6. If it does, add the sorted pair (element, complement) to the result set to maintain uniqueness.
7. Add the current element to the visited set.
8. Convert the result set to a list of tuples and return it.

Here are additional details:
- Ensure each pair (a, b) is returned in ascending order (a < b).
- The output should be a list of tuples sorted in ascending order by the first element of each tuple.

Implement the function `findPairs(nums, target)` based on the functionality described above.

Example:
- `findPairs([1, 2, 3, 4, 3], 6) == [(2, 4), (3, 3)]`

Implement `findPairs(nums: list[int], target: int) -> list[tuple[int, int]]`.
