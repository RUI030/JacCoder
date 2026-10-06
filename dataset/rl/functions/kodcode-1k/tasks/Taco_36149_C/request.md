# max_teams

Returns the maximum number of teams that can be formed from the given participants.

Parameters:
n (int): The number of participants.
k (int): The required number of members in each team.
skills (list of int): The skill levels of each participant.

Returns:
int: The maximum number of teams that can be formed.

Examples:
>>> max_teams(6, 3, [1, 2, 3, 1, 2, 3])
2
>>> max_teams(7, 2, [1, 2, 2, 3, 4, 5, 6])
3

Implement `max_teams(n: int, k: int, skills: list[int]) -> int`.
