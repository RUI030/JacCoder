# subarray_sums

You are given an array `a` of size `N` and an integer `K`. Create a function that finds the sum of each possible sub-array of size `K` and prints these sums in order from the beginning. For instance, given the array `{2, 3, 5, 1, 4}` and `K = 2`, the sub-arrays of size `K = 2` are `{2, 3}`, `{3, 5}`, `{5, 1}`, `{1, 4}`, and the sums of these sub-arrays are 5, 8, 6, and 5 respectively.

Constraints

* $1 \leq N \leq 10^5$
* $1 \leq K \leq 10^5$
* $1 \leq a_i \leq 10^3$
* $K \leq N$

Input

The input is given in the following format:

$N$ $K$
$a_1$ $a_2$ ... $a_N$

Output

Print a sequence of the sums in one line. Print a space character between adjacent elements.

Example

Input

5 2
2 3 5 1 4

Output

5 8 6 5

Example:
- `subarray_sums([2, 3, 5, 1, 4], 2) == [5, 8, 6, 5]`

Implement `subarray_sums(arr: list[int], K: int) -> list[int]`.
