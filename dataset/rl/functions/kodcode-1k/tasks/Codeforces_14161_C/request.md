# max_balanced_teams

Determines the maximum number of balanced teams that can be formed.

:param n: Number of participants
:param d: Maximum allowed skill difference in a team
:param skill_levels: List of skill levels of the participants
:return: Maximum number of balanced teams

>>> max_balanced_teams(8, 5, [10, 12, 15, 22, 20, 12, 20, 25])
2
>>> max_balanced_teams(6, 2, [1, 3, 5, 7, 9, 11])
0

Implement `max_balanced_teams(n: int, d: int, skill_levels: list[int]) -> int`.
