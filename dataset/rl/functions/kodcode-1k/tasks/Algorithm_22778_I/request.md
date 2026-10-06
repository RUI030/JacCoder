# fibonacci

### Task: Implement a Dynamic Programming Solution for Fibonacci Sequence

#### Scenario
You are provided with the task of generating the Fibonacci sequence up to the `n`-th term. The Fibonacci sequence is defined as: 

* F(0) = 0, F(1) = 1
* F(n) = F(n-1) + F(n-2), for n > 1

A naive recursive approach to compute the Fibonacci sequence can be highly inefficient due to repeated calculations. Therefore, you need to implement an optimized version using dynamic programming to store the results of subproblems and avoid redundant computations.

#### Requirements
1. **Function Implementation**:
   Implement the function `fibonacci(n)` in Python that achieves the following:
   * Takes as input:
     - `n`: an integer representing the term of the Fibonacci sequence to compute.
   * Returns:
     - An integer which is the `n`-th term of the Fibonacci sequence.

#### Input and Output Format
* **Input**:
  * `n`: a non-negative integer.
* **Output**:
  * Integer representing the `n`-th term of the Fibonacci sequence.

#### Constraints
* `0 <= n <= 50`
* You should use an iterative approach and leverage a list or array to store intermediate results of the Fibonacci sequence for optimal performance.

#### Example Usage
* **Input**: `n = 10`
* **Output**: `55`

#### Performance Requirements
Your implementation should minimize time complexity to O(n) and space complexity to O(n), ensuring it efficiently handles the upper limit of the input range.

Example:
- `fibonacci(0) == 0`

Implement `fibonacci(n: int) -> int`.
