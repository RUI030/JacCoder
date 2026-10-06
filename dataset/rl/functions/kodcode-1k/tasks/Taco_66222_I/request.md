# rotate_right

Given a list of space-separated integers and an integer k, rotate the list to the right by k steps. A rotation by one step moves the last element of the list to the first position, shifting all remaining elements to the right by one position. 

Input:
The first line contains the integer k.
The second line contains a space-separated list of integers.

Output:
Print the list after rotating it k steps to the right.

Constraints:
1 ≤ k ≤ 100
1 ≤ list length ≤ 10^5
-10^6 ≤ integer values in the list ≤ 10^6

Note:
The rotation should be performed efficiently, ideally in O(n) time complexity.

SAMPLE INPUT
3
1 2 3 4 5 6

SAMPLE OUTPUT
4 5 6 1 2 3

Explanation:
After rotating the list to the right by 3 steps, the original list [1, 2, 3, 4, 5, 6] becomes [4, 5, 6, 1, 2, 3].

Example:
- `rotate_right([1, 2, 3, 4, 5, 6], 3) == [4, 5, 6, 1, 2, 3]`

Implement `rotate_right(lst: list[int], k: int) -> list[int]`.
