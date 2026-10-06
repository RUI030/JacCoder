# second_highest

You are required to implement a function that finds the second highest number in a list of integers. This is a common problem that reinforces your ability to handle lists and edge cases in coding.

**Function Name**: `second_highest`

**Function Role**: The function should accept a list of integers and return the second highest unique number in the list. If the list contains fewer than two unique numbers, the function should return `None`.

**Input**:
- A list of integers, e.g., `[4, 1, 5, 2, 4, 5]`.

**Output**:
- An integer representing the second highest number in the list, or `None` if such a number does not exist.

**Example**:

1. If the input is `[4, 1, 5, 2, 4, 5]`, the function should return `4`.
2. If the input is `[7, 7, 7]`, the function should return `None` since there are not enough unique numbers.
3. If the input is `[10, -1, 2, 10, 7, -1, 7]`, the function should return `7`.

**Constraints**:
- The input list will have at least one element.
- The integers can be either positive or negative.
- Efficiency matters; aim for a solution with a time complexity better than \(O(n^2)\).

Example:
- `second_highest([4, 1, 5, 2, 4, 5]) == 4`

Implement `second_highest(lst: list[int]) -> int | None`.
