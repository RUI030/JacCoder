# pigeonhole_sort

Pigeonhole Sort is a sorting algorithm that is efficient for arrays where the range of the possible values (`Max - Min`) is not significantly larger than the number of elements `n`. In this task, you will implement a modified version of Pigeonhole Sort that can handle arrays containing negative values as well.

### Objective
Implement a function `pigeonhole_sort(arr)` that sorts the array `arr` using the Pigeonhole Sorting technique.

### Requirements
* **Input**: A list of integers `arr` which may contain negative values.
* **Output**: The input list `arr` sorted in non-decreasing order.
* **Constraints**: 
  - The array will contain at most 10^5 elements.
  - The values of the elements in the array will be between -10^4 and 10^4.

### Example Scenarios

#### Example 1:
* **Input**: `[-5, -10, 0, -3, 8, 5, -1, 10]`
* **Output**: `[-10, -5, -3, -1, 0, 5, 8, 10]`

#### Example 2:
* **Input**: `[1, 1, 1, 0, 0, 0, -1, -1, -1]`
* **Output**: `[-1, -1, -1, 0, 0, 0, 1, 1, 1]`

#### Implementation Note
Handle the creation of holes appropriately to manage the entire range of values, including negative values.

Example:
- `pigeonhole_sort([-5, -10, 0, -3, 8, 5, -1, 10]) == [-10, -5, -3, -1, 0, 5, 8, 10]`

Implement `pigeonhole_sort(arr: list[int]) -> list[int]`.
