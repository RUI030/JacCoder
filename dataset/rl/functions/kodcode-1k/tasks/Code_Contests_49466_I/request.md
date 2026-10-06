# smallest_possible_element

You are given an array of integers. Your goal is to form a new array by performing the following operation any number of times on the given array: select two adjacent elements, remove them, and insert their sum in their place. You can perform this operation as many times as you like until only one element remains in the array. Ultimately, you need to determine the smallest possible value of the remaining element.

Input

The first line contains a single integer t (1 ≤ t ≤ 100) – the number of test cases. Each test case is represented by two lines.

The first line of i-th test case contains one integer n (2 ≤ n ≤ 100) – the length of the array.

The second line of i-th test case contains n integers a1, a2, ..., an (1 ≤ ai ≤ 100) – the elements of the array.

Output

For each test case print one line.

For i-th test case, print the smallest possible value of the remaining element.

Example

Input

3
5
1 2 3 4 5
3
8 1 4
4
9 2 9 4

Output

15
13
24

Note

In the first test case, one of the ways to achieve the smallest possible value of 15 is the following sequence of operations:

1 2 3 4 5 → 3 3 4 5 → 6 4 5 → 10 5 → 15

In the second test case, one of the ways to achieve the smallest possible value of 13 is the following sequence of operations:

8 1 4 → 9 4 → 13

In the third test case, one of the ways to achieve the smallest possible value of 24 is the following sequence of operations:

9 2 9 4 → 11 9 4 → 20 4 → 24

Example:
- `smallest_possible_element(3, [(5, [1, 2, 3, 4, 5]), (3, [8, 1, 4]), (4, [9, 2, 9, 4])]) == [15, 13, 24]`

Implement `smallest_possible_element(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int]`.
