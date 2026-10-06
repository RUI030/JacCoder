# unique_paths

You are tasked with developing a function that computes the number of unique paths from the top-left corner to the bottom-right corner of an `m x n` grid. You can only move either down or right at any point in time.

**Function Name:** `unique_paths`

**Parameters:**

1. `m` (int): The number of rows in the grid.
2. `n` (int): The number of columns in the grid.

**Return Value:**
- Returns an integer representing the number of unique paths from the top-left to the bottom-right corner of the grid.

**Objective:**
The objective is to employ combinatorial mathematics to solve this problem. Specifically, you need to calculate the binomial coefficient to determine the number of paths.

### Formula
The number of unique paths in an `m x n` grid is given by:
\[ \text{unique\_paths}(m, n) = \frac{(m+n-2)!}{(m-1)!(n-1)!} \]

This formula arises from the fact that the problem of finding unique paths is equivalent to choosing `m-1` movements down from a total of `m+n-2` movements (down + right).

### Example:
For instance,
- If `m` is 3 and `n` is 7, the number of unique paths can be calculated using the formula:
\[ \text{unique\_paths}(3, 7) \]

You are expected to:
1. Calculate the factorial of the required numbers.
2. Apply the combinatorial formula to obtain the result.
3. Return the computed value.

### Requirements
Use the following math library functions:
- `math.factorial`

Example:
- `unique_paths(3, 7) == 28`

Implement `unique_paths(m: int, n: int) -> int`.
