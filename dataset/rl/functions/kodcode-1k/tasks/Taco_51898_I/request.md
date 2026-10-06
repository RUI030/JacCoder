# can_construct_pattern

Clara loves creating intricate patterns with beads on a string. Each string consists of multiple beads, each represented by a number corresponding to its color. Clara has particular rules for constructing her patterns: once a bead of a certain color has been added to the string, she can add more beads of the same color, but only consecutively. Once another color is added, she can't go back and add beads of the previous color in that area again.

Clara wants to create a pattern that exactly matches a pre-defined sequence. However, she can only add beads from left to right and must follow her rules strictly. Can you help Clara determine if it's possible to construct the desired pattern with the given rules?

-----Input-----
The input consists of a single test case. The first line of this test case contains an integer $t$ ($1 \le t \le 100$), the number of test cases. Each test case consists of two lines: the first line contains one integer $n$ ($1 \le n \le 10^5$), the length of the desired pattern. The second line contains $n$ integers $a_i$ ($1 \le a_i \le 10^6$), representing the color of each bead in the desired pattern.

-----Output-----
For each test case, output "YES" if Clara can construct the pattern following her rules, and "NO" otherwise.

-----Examples-----
Sample Input 1:
3
6
1 1 2 2 3 3
4
1 2 1 2
5
2 2 3 3 2

Sample Output 1:
YES
NO
NO

Example:
- `can_construct_pattern(3, [(6, [1, 1, 2, 2, 3, 3]), (4, [1, 2, 1, 2]), (5, [2, 2, 3, 3, 2])]) == ['YES', 'NO', 'NO']`

Implement `can_construct_pattern(t: int, test_cases: list[tuple[int, list[int]]]) -> list[str]`.
