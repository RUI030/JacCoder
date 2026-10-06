# can_assign_booths_unique

John is organizing a charity event and wants to set up booths to serve the attendees. Each type of booth requires a different number of staff members to operate efficiently. He has a list of how many staff members are assigned to each booth type, and he has to ensure he assigns booths such that the total number of staff members used in each combination is unique. If there are two combinations of booths that use the same number of staff members, John will consider the event planning impossible and output "Impossible". If he successfully assigns unique total staff numbers to each combination, he will proceed and output "Possible". Help John determine whether it's possible to assign booths uniquely.

Input:
- First line contains an integer n, the number of different booth types.
- Second line contains n integers representing the number of staff members required for each booth type.

Output:
- "Possible" if John can uniquely assign booths such that no two combinations of staff members use the same total number.
- "Impossible" otherwise.

SAMPLE INPUT
4
1 2 3 4

SAMPLE OUTPUT
Possible

SAMPLE INPUT
3
1 2 2

SAMPLE OUTPUT
Impossible

Example:
- `can_assign_booths_unique(4, [1, 2, 3, 4]) == 'Possible'`

Implement `can_assign_booths_unique(n: int, staff_requirements: list[int]) -> str`.
