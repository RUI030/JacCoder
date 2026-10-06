# frequency_sort

You are required to implement a function that sorts an array of integers based on the frequency of values. More frequent numbers should appear earlier in the sorted array. If two values have the same frequency, they should appear in ascending numerical order.

Here are the detailed requirements:

1. **Function Name**: `frequency_sort`
2. **Parameter**: 
   - `arr`: A list of integers.
3. **Output**:
   - The function should return a list of integers sorted based on their frequency as described.

**Instructions**:
- Use the `collections.Counter` class to count the frequency of each integer in the input list.
- Sort the array first by the frequency of the values in descending order, and then by the values themselves in ascending order.

**Example**:
Suppose `arr = [1, 1, 2, 2, 2, 3, 3, 4]`.

Calling `frequency_sort(arr)` should return `[2, 2, 2, 1, 1, 3, 3, 4]`.

Write the function `frequency_sort` to accomplish this task.

Example:
- `frequency_sort([1, 1, 2, 2, 2, 3, 3, 4]) == [2, 2, 2, 1, 1, 3, 3, 4]`

Implement `frequency_sort(arr: list[int]) -> list[int]`.
