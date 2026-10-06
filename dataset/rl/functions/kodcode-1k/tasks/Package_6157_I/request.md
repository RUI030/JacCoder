# generate_fibonacci_sum

Design a function named `generate_fibonacci_sum(n)` that takes an integer `n` as input and returns the sum of the first `n` Fibonacci numbers. The Fibonacci sequence is defined as follows:

1. The first two Fibonacci numbers are 0 and 1.
2. Each subsequent Fibonacci number is the sum of the two preceding ones.

For example, if `n = 5`, the Fibonacci sequence up to the 5th term is [0, 1, 1, 2, 3], and the sum is 0 + 1 + 1 + 2 + 3 = 7.

Your task is to implement the `generate_fibonacci_sum(n)` function to perform the following steps:

1. Check if `n` is a positive integer.
2. Calculate the first `n` Fibonacci numbers.
3. Sum these numbers and return the sum.

Your implementation should handle edge cases (e.g., n = 0). Consider both iterative and recursive approaches, but aim for a solution with optimal performance and readability.

Example:
- `generate_fibonacci_sum(1) == 0`

Implement `generate_fibonacci_sum(n: int) -> int`.
