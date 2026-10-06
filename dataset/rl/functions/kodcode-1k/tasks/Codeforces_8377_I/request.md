# map_ids

A company is redesigning their employee ID system to improve security. Each employee is issued a new ID card with a unique alphanumeric identifier. However, the transition period involves both the old numeric IDs and the new alphanumeric IDs. To ensure smooth operations during the transition, a mapping between the old and new IDs must be maintained.

You are given two lists, one containing the old IDs and another containing the new IDs, both of the same length. Each old ID should map directly to a new ID. Write a program to create this mapping.

The first line contains a single integer n — the number of employees (1 ≤ n ≤ 10^5).

The second line contains n numbers o1, o2, ..., on (1 ≤ oi ≤ 10^5) — the old IDs of the employees.

The third line contains n strings n1, n2, ..., nn — the new alphanumeric IDs of the employees. Each string consists of between 1 and 10 characters, which can be either digits or lowercase letters.

Print n lines, each containing an old ID followed by the corresponding new ID.

In the first test, each old ID is directly mapped to the corresponding new ID.

In the second test, the old IDs and new IDs must be paired correctly according to their positions in the input lists.

Example:
Input:
3
101 202 303
a1b2 c3d4 e5f6

Output:
101 a1b2
202 c3d4
303 e5f6

Example:
- `map_ids(3, [101, 202, 303], ['a1b2', 'c3d4', 'e5f6']) == [(101, 'a1b2'), (202, 'c3d4'), (303, 'e5f6')]`

Implement `map_ids(n: int, old_ids: list[int], new_ids: list[str]) -> list[tuple[int, str]]`.
