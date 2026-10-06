# check_sorted

Write a program that reads an integer n and then n space-separated integers. The program should check if the list of numbers is sorted in non-decreasing order. Print "Sorted" if it is sorted, otherwise print "Unsorted".

Constraints

* 1 ≤ n ≤ 100
* -10^5 ≤ each integer ≤ 10^5

Input

An integer n followed by a list of n space-separated integers.

Output

Print "Sorted" if the list is sorted in non-decreasing order, otherwise print "Unsorted".

Examples

Input

5 1 2 3 4 5

Output

Sorted

Input

4 1 3 2 4

Output

Unsorted

Example:
- `check_sorted(5, [1, 2, 3, 4, 5]) == 'Sorted'`

Implement `check_sorted(n: int, arr: list[int]) -> str`.
