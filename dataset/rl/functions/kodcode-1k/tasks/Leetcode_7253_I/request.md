# max_sum_of_product

You are given an array `arr` of `n` integers, where all integers are unique. The array can be rotated at any pivot, meaning the order of the elements can be changed by placing any element at the start and rearranging the rest accordingly. Your task is to find the *maximum* sum of the products of corresponding elements from two identical `n`-length arrays `A` and `B`, where `B` is a rotation of `A`. Formally, given the array `A`, you need to compute the maximum value of the sum `A[i] * B[i]` where `B` is a rotation of `A`. Return the maximum sum.

Example:
- `max_sum_of_product([10]) == 100`

Implement `max_sum_of_product(arr: list[int]) -> int`.
