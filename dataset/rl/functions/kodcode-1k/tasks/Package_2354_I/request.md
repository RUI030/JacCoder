# product_of_unique_numbers

You are required to design a Jac function named `product_of_unique_numbers` that takes a list of integers as input and returns the product of all the unique numbers in the list. A number is considered unique if it appears exactly once in the list.

The function should behave as follows:
1. Iterate through the list and identify numbers that appear exactly once.
2. Compute the product of these unique numbers.
3. Return the product. If there are no unique numbers, return 1.

Here are the specific requirements to consider:
- The input list will contain only integers and may be empty.
- The function should handle both positive and negative numbers.
- The function should return 1 if there are no unique numbers in the list.
- You can assume the list will not contain any zeroes.

Please implement the `product_of_unique_numbers` function as described.

Example:
- `product_of_unique_numbers([1, 2, 3, 4]) == 24`

Implement `product_of_unique_numbers(nums: list[int]) -> int`.
