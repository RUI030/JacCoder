# product_except_self

You are required to write a Jac function that reads a list of integers from the user and returns a new list where each element is the product of all the numbers in the original list except for the number at that position. The function should not use division.

The function to implement is `product_except_self`, and it should ensure that:
1. It takes a single list of integers as input.
2. It returns a list of the products as described.

For example:
- Input: `[1, 2, 3, 4]`
- Output: `[24, 12, 8, 6]`

In this example, the first number in the output list is the product of `2 * 3 * 4 = 24`, the second number is the product of `1 * 3 * 4 = 12`, the third number is the product of `1 * 2 * 4 = 8`, and the fourth number is the product of `1 * 2 * 3 = 6`. 

You are expected to handle possible edge cases, such as empty input lists or lists with one element. Note that the function must be efficient and handle large lists gracefully.

Write the `product_except_self` function as specified.

Example:
- `product_except_self([1, 2, 3, 4]) == [24, 12, 8, 6]`

Implement `product_except_self(nums: list[int]) -> list[int]`.
