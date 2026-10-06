# can_all_elements_be_zero

You are given a binary array of length n. You can perform the following operation any number of times: choose a subarray of length exactly k, and flip all its bits (i.e., change all 0s to 1s and all 1s to 0s in that subarray).

Determine whether you can make all elements of the array equal to 0 using this operation.

Input

The first line contains two positive integers n and k (1 ≤ k ≤ n ≤ 100) — the length of the array and the length of the subarray to be flipped.

The second line contains n integers — the binary array.

Output

Output YES if it's possible to make all elements of the array equal to 0, otherwise output NO.

Examples

Input

5 3
1 0 1 0 1

Output

YES

Input

6 4
1 1 0 1 1 0

Output

NO

Input

4 2
1 1 1 1

Output

YES

Example:
- `can_all_elements_be_zero(5, 3, [0, 0, 0, 0, 0]) == 'YES'`

Implement `can_all_elements_be_zero(n: int, k: int, arr: list[int]) -> str`.
