# total_blocks_to_add

Toy Blocks

Andre loves building structures out of blocks. He has a collection of n blocks that he arranges in a line. Each block has a certain height, and Andre wants to determine how many blocks he needs to add to make all of the blocks the same height as the tallest one in the line.

Your task is to determine the total number of blocks Andre needs to add to achieve this.

-----Input-----

The first line contains a single integer n (1 ≤ n ≤ 1000), the number of blocks in the line. The second line contains n space-separated integers h1, h2, ..., hn (1 ≤ hi ≤ 10^6), where hi represents the height of the i-th block.

-----Output-----

Output a single integer, the number of blocks Andre needs to add to make all blocks the same height as the tallest block.

-----Examples-----
Input
4
1 3 2 4

Output
6

Input
3
5 5 5

Output
0

Input
5
2 2 2 2 2

Output
0

-----Note-----

In the first example case, we have blocks with heights 1, 3, 2, and 4. The tallest block is 4 units high. To make all blocks 4 units high, Andre needs to add 3 units to the first block, 1 unit to the second block, and 2 units to the third block, which totals to 6 units.

In the second example, all blocks are already 5 units high, so no additional blocks are needed.

In the third example, all blocks are already 2 units high, so no additional blocks are needed.

Example:
- `total_blocks_to_add(4, [1, 3, 2, 4]) == 6`

Implement `total_blocks_to_add(n: int, heights: list[int]) -> int`.
