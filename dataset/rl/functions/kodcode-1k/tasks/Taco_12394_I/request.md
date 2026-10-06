# contains_nearby_duplicates

You are given an integer array `nums` and an integer `k`. Your task is to determine whether the array contains duplicates within a `k` distance. In other words, if there are two distinct indices `i` and `j` in the array such that `nums[i] == nums[j]` and the absolute difference between `i` and `j` is at most `k`.

Input

The first line contains two integers `n` (1 ≤ n ≤ 10^5) and `k` (1 ≤ k ≤ n-1) — the size of the array and the maximum allowed distance.

The second line contains `n` space-separated integers `nums[i]` (-10^9 ≤ nums[i] ≤ 10^9).

Output

Print "YES" if there are duplicates within a `k` distance, otherwise, print "NO".

Examples

Input

6 3
1 2 3 1 2 3

Output

YES

Input

4 2
1 0 1 1

Output

YES

Input

3 1
1 2 3

Output

NO

Example:
- `contains_nearby_duplicates([1, 2, 3, 1, 2, 3], 3) == 'YES'`

Implement `contains_nearby_duplicates(nums: list[int], k: int) -> str`.
