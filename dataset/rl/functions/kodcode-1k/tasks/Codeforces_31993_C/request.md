# longest_empty_segment

Find the length of the longest contiguous segment of empty cells for each test case.

Args:
t (int): The number of test cases.
cases (List[str]): A list of strings where each string represents the cave.

Returns:
List[int]: A list containing the length of the longest contiguous segment of empty cells for each test case.

>>> longest_empty_segment(3, ['..##...#..##.', '##.##....', '..###..#...###...#.'])
[3, 4, 3]

>>> longest_empty_segment(1, ['#####'])
[0]

Implement `longest_empty_segment(t: int, cases: list[str]) -> list[int]`.
