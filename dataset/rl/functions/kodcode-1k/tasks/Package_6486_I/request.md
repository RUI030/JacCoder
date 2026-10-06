# merge_sorted_arrays

You need to implement a function named `merge_sorted_arrays(arr1, arr2)` that takes two sorted arrays as input and returns a single sorted array by merging the two provided arrays.

Your function should work as follows:
1. **Parameters**:
   - `arr1` (list): A list of integers sorted in ascending order.
   - `arr2` (list): Another list of integers sorted in ascending order.

2. **Return Values**:
   - A single list containing all the elements from `arr1` and `arr2`, sorted in ascending order.

3. **Conditions**:
   - If either `arr1` or `arr2` is empty, the function should return the non-empty array.
   - If both arrays are empty, the function should return an empty list.
   - The function should not use any built-in sorting functions.

**Example**:
- `merge_sorted_arrays([1, 3, 5], [2, 4, 6])` should return `[1, 2, 3, 4, 5, 6]`.
- `merge_sorted_arrays([], [2, 4, 6])` should return `[2, 4, 6]`.
- `merge_sorted_arrays([1, 3, 5], [])` should return `[1, 3, 5]`.
- `merge_sorted_arrays([], [])` should return `[]`.

Hint:
You may utilize a two-pointer technique where you maintain one pointer for each array and compare the elements at those pointers to decide which element should be added to the final merged array.

Example:
- `merge_sorted_arrays([1, 3, 5], [2, 4, 6]) == [1, 2, 3, 4, 5, 6]`

Implement `merge_sorted_arrays(arr1: list[int], arr2: list[int]) -> list[int]`.
