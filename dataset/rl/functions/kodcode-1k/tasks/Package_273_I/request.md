# count_unique_integers

You need to implement a function called `count_unique_integers` that counts the number of unique integers in a given list of integers. The function should consider the performance impact and avoid unnecessary computations or memory usage. It should also be able to handle large inputs efficiently.

The specifications for your function are as follows:

- **Function Name**: `count_unique_integers`
- **Parameters**:
  - `numbers` (list of integers): A list containing integers for which unique numbers need to be counted.

The function should return an integer representing the count of unique integers in the given list.

### Examples
- `count_unique_integers([1, 2, 2, 3, 4, 4, 5])` should return `5`
- `count_unique_integers([1, 1, 1, 1, 1])` should return `1`
- `count_unique_integers([])` should return `0`

Example:
- `count_unique_integers([1, 2, 2, 3, 4, 4, 5]) == 5`

Implement `count_unique_integers(numbers: list[int]) -> int`.
