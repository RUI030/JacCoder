# rearrange_possible

You are given an array of integers and a positive integer k. Determine whether it's possible to rearrange the elements in the array such that the difference between any two consecutive elements is at least k. If possible, provide one such rearrangement.

Constraints

* 2 ≤ n ≤ 10^5, where n is the number of elements in the array.
* 1 ≤ k ≤ 10^9
* 1 ≤ a_i ≤ 10^9, where a_i is an element of the array.

Input

If the input is given from Standard Input in the following format:


n k

a_1 a_2 ... a_n


Output

If there does not exist an arrangement that satisfies the condition, print `No`.

Otherwise, print `Yes` in the first line, and print the rearranged array in the second line.


Examples

Input

5 3

1 4 7 2 10


Output

Yes
1 4 7 10 2


Input

3 6

1 2 3


Output

No


Input

4 5

10 1 8 3


Output

Yes
1 10 3 8

Example:
- `rearrange_possible(5, 3, [1, 4, 7, 2, 10]) == 'Yes\n1 10 2 7 4'`

Implement `rearrange_possible(n: int, k: int, a: list[int]) -> str`.
