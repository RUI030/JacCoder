# process_votes

Process a list of votes on multiple issues and return the final counts
for each option of every issue.

Parameters:
m (int): number of issues
options (list of list of int): initial counts for each option of every issue
votes (list of tuple of int): each vote represented as a tuple (a, b, c)

Returns:
list of list of int: final counts for each option of every issue

>>> process_votes(1, [[5]], [(1, 1, 1)])
[[6]]

>>> process_votes(1, [[5]], [(1, 1, -1)])
[[4]]

Implement `process_votes(m: int, options: list[list[int]], votes: list[tuple[int, int, int]]) -> list[list[int]]`.
