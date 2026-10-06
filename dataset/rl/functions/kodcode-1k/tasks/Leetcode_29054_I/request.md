# find_pair_with_sum

Given a **sorted** array of distinct integers `arr`, write a function that finds a pair of elements that sum to a given target value `t`. Return _the pair of indices_ `[i, j]` _such that_ `arr[i] + arr[j] == t`, _where_ `i < j`. If no such pair exists, return `[-1, -1]`. Your solution should have a time complexity of O(n).

Example:
- `find_pair_with_sum([1, 2, 3, 4, 5], 5) == [0, 3]`

Implement `find_pair_with_sum(arr: list[int], t: int) -> list[int]`.
