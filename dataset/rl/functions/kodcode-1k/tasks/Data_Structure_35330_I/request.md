# is_magic_number

Given a non-negative integer, determine if it is a Magic Number. A Magic Number is a number which eventually reduces to 1 when the sum of its digits is repeatedly calculated until a single digit is obtained.

Write a function `is_magic_number(n: int) -> bool` that determines if the input number `n` is a Magic Number.

### Input
* `n` (non-negative integer)

### Output
* A boolean value. Return `True` if `n` is a Magic Number; otherwise, return `False`.

### Constraints
* `0 <= n <= 10^9`

### Examples
1. Input: `50113`
   Output: `True`
   
2. Input: `1234`
   Output: `True`
   
3. Input: `199`
   Output: `True`
   
4. Input: `111`
   Output: `False`

### Notes
* Ensure your solution handles the maximum constraint efficiently.
* Consider edge cases where `n` is 0 or a single-digit number.

Example:
- `is_magic_number(1) == True`

Implement `is_magic_number(n: int) -> bool`.
