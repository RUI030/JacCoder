# fibonacci

Write a function named `fibonacci(n)` that returns the `n`th number in the Fibonacci sequence. The Fibonacci sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.

To solve this problem, adhere to the following requirements:
1. If `n` is 0, return 0.
2. If `n` is 1, return 1.
3. For values of `n` greater than 1, calculate the `n`th Fibonacci number iteratively using a loop. Avoid using recursion to prevent stack overflow issues for large values of `n`.
4. Use two variables to keep track of the two previous numbers in the Fibonacci sequence and update them in each iteration of the loop.

Ensure your implementation is efficient in terms of time and space complexity.

Example:
- `fibonacci(0) == 0`

Implement `fibonacci(n: int) -> int`.
