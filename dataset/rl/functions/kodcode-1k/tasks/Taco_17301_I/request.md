# find_smallest_missing_positive

Given an array of integers, you have to find the smallest positive integer (greater than zero) that does not occur in the array.

Input

- The first line contains an integer n (1 ≤ n ≤ 100,000), the size of the array.
- The second line contains n integers separated by spaces (each between -1,000,000 and 1,000,000), representing the elements of the array.

Output

- Output a single integer, the smallest positive integer that is missing from the array.

Examples

Input

5
1 3 6 4 1 2

Output

5

Input

3
1 2 3

Output

4

Input

4
-1 -3 1 2

Output

3

Explanation

In the first example, the numbers 1, 2, 3, and 4 are present, so the smallest positive integer missing is 5.

In the second example, the numbers 1, 2, and 3 are present, so the smallest positive integer missing is 4.

In the third example, despite the presence of negative numbers and mixed values, the smallest positive integer missing is 3.

Example:
- `find_smallest_missing_positive(5, [1, 3, 6, 4, 1, 2]) == 5`

Implement `find_smallest_missing_positive(n: int, arr: list[int]) -> int`.
