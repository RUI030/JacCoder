# modify_sequence

You are given a sequence of n integers, a1, a2, ..., an. You need to modify the sequence such that each element is equal to the sum of the previous k elements.

For example, if k=3, a new sequence will be b1, b2, ..., bn where:
- b1 = a1
- b2 = a1 + a2
- b3 = a1 + a2 + a3
- b4 = a2 + a3 + a4
- ...

The condition is applied in a cyclic manner, meaning for elements at the end of the array, it should wrap around to the beginning of the sequence when summing.

You are required to print the resulting modified sequence.

Input

The first line contains two integers n and k (1 ≤ n, k ≤ 1000) – the length of the sequence and the number of elements to sum, respectively.

The second line contains n integers a1, a2, ..., an (0 ≤ ai ≤ 1000), representing the original sequence.

Output

Output a single line containing n integers, the modified sequence.

Examples

Input
4 2
1 2 3 4

Output
1 3 5 7

Input
5 3
1 2 3 4 5

Output
1 3 6 9 12

Input
3 1
3 3 3

Output
3 3 3

Explanation

In the first test case, k=2:
- b1 = a1 = 1
- b2 = a1 + a2 = 1 + 2 = 3
- b3 = a2 + a3 = 2 + 3 = 5
- b4 = a3 + a4 = 3 + 4 = 7

In the second test case, k=3:
- b1 = a1 because there are no elements before it
- b2 = a1 + a2 because there is only one element before it
- b3 = a1 + a2 + a3 because there are two elements before it
- b4 = a2 + a3 + a4 as it completes k elements
- b5 = a3 + a4 + a5 as it moves forward – sum of the last k elements.

Example:
- `modify_sequence(4, 2, [1, 2, 3, 4]) == [1, 3, 5, 7]`

Implement `modify_sequence(n: int, k: int, a: list[int]) -> list[int]`.
