# rotate_array

### Array Rotation

#### Objective
Write a Jac function that performs a left rotation on an array of integers and returns the rotated array.

#### Problem Statement
Given an array of integers `arr` and a number `d`, implement a function `rotate_array(arr: List[int], d: int) -> List[int]` that rotates the elements of `arr` to the left by `d` positions. Ensure that your solution works efficiently for large arrays.

#### Input and Output Format
* **Input**: 
  * `arr`: A list of integers (1 <= len(arr) <= 10^5, 1 <= arr[i] <= 10^9)
  * `d`: An integer representing the number of positions to rotate the array left by (0 <= d <= len(arr)).
* **Output**: A list of integers representing the array after it has been rotated left by `d` positions.

#### Constraints
* The input list can be of significant length, so your solution should aim for optimal performance.
* d can be zero, in which case the array should remain unchanged.

#### Performance Requirements
* Time Complexity: O(n), where n is the length of `arr`.
* Space Complexity: O(1) if rotations are performed in place or O(n) if a new list is returned.

#### Example 1
* **Input**: `arr = [1, 2, 3, 4, 5]`, `d = 2`
* **Output**: `[3, 4, 5, 1, 2]`

#### Example 2
* **Input**: `arr = [10, 20, 30, 40, 50, 60, 70]`, `d = 4`
* **Output**: `[50, 60, 70, 10, 20, 30, 40]`

#### Example 3
* **Input**: `arr = [15, 25, 35]`, `d = 0`
* **Output**: `[15, 25, 35]`

#### Tasks
1. Implement the function `rotate_array(arr: List[int], d: int) -> List[int]`.
2. Write a suite of test cases to ensure your implementation is correct, covering edge cases such as `d = 0` and `d` equal to the length of the array.

#### Notes
* Be aware of cases where `d` is larger than the length of the array; rotating by `d` should be equivalent to rotating by `d % len(arr)`.
* Ensure your solution maintains the integrity of the array and performs rotations efficiently.

Example:
- `rotate_array([1, 2, 3, 4, 5], 2) == [3, 4, 5, 1, 2]`

Implement `rotate_array(arr: list[int], d: int) -> list[int]`.
