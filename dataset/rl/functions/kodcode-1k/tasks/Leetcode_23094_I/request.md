# can_partition_into_equal_groups

You are given an integer array `arr`, where each element represents a certain number of elements forming a group. For example, if `arr[i] = 3`, it indicates that there are 3 elements forming a sub-group at the `i-th` index. The task is to determine if it's possible to partition the entire array into sub-groups of equal sizes. Return `True` if it is possible to equally partition the array into sub-groups, otherwise return `False`. This means checking if you can divide the elements into groups such that the size of every group is identical.

Example:
- Input: `arr = [3, 3, 3, 3, 2, 2]`
- Output: `True` (Explanation: The sub-groups can be [3, 3, 3] [3, 3, 3] or [2, 2] [2, 2] [3, 3, 3])

- Input: `arr = [3, 3, 3, 3, 2, 2, 1]`
- Output: `False` (Explanation: It is impossible to partition the array into equal-sized sub-groups due to 1 extra element.)

Example:
- `can_partition_into_equal_groups([3, 3, 3, 3, 2, 2]) == True`

Implement `can_partition_into_equal_groups(arr: list[int]) -> bool`.
