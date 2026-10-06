# merge_sorted_arrays

Implement a function called `merge_sorted_arrays` that takes in two sorted arrays of integers (`arr1` and `arr2`) and returns a single sorted array containing all elements from both input arrays.

The function should:

1. Initialize an empty list `merged` to hold the merged result.
2. Use two pointers, initially set at the start of their respective arrays.
3. Iterate through both arrays, comparing the elements at the pointer positions:
    - Append the smaller element to the `merged` list.
    - Move the pointer of the array from which the element was taken.
4. If one of the arrays is exhausted before the other, append all remaining elements of the non-exhausted array to the `merged` list.
5. Return the `merged` list which should be sorted.

**Constraints:**
- The input arrays `arr1` and `arr2` are guaranteed to be sorted in non-decreasing order.
- The arrays may have different lengths.
- The elements of the arrays are integers within the range of -10^9 to 10^9.
- The function should have a time complexity of O(n + m) where n and m are the lengths of the two input arrays.

Example:
- `merge_sorted_arrays([], []) == []`

Implement `merge_sorted_arrays(arr1: list[int], arr2: list[int]) -> list[int]`.
