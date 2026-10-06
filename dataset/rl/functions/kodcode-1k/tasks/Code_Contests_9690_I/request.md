# can_plant_seedlings

Eve has a number of tree seedlings she wants to plant in a garden. She must follow certain planting conditions:

1. She can plant one seedling between two previously planted seedlings if there is at least one unoccupied spot between them.
2. She can exchange the position of any two seedlings.

Eve wants to plant the seedlings such that no two seedlings are adjacent, in order to allow space for their growth. However, the garden has a limited number of spots.

Can you help her determine if it is possible to plant all the seedlings following these conditions?

Input

The first line contains one integer t (1 ≤ t ≤ 100) — the number of test cases. The following t lines describe the test cases:

Each line contains two integers n and k separated by a space (0 ≤ k ≤ 1000, n ≤ 2k) — where n represents the total number of available spots in the garden, and k represents the number of seedlings Eve wants to plant.

Output

For each test case, print "YES" if it is possible to plant all the seedlings following the conditions; otherwise, print "NO".

Example

Input

3
5 2
7 4
4 4

Output

YES
YES
NO

Note

For the first test case, Eve can plant the two seedlings as follows:
- _ S _ S _
Where '_' denotes an unoccupied spot and 'S' denotes a seedling.

For the second test case, Eve can plant four seedlings as follows:
- S _ S _ S _ S

For the third test case, it is impossible to plant all four seedlings with no two being adjacent because the garden only has 4 spots.

Example:
- `can_plant_seedlings(1, [(5, 0)]) == ['YES']`

Implement `can_plant_seedlings(t: int, cases: list[tuple[int, int]]) -> list[str]`.
