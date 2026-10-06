# min_rooms

Determines the minimum number of rooms required to accommodate all the
participants under the condition that no two participants in the same room
have skill levels that differ by more than k.

Args:
n (int): The number of participants.
k (int): The maximum allowed difference in skill levels within the same room.
skill_levels (List[int]): Skill levels of the participants.

Returns:
int: The minimum number of rooms needed.

Examples:
>>> min_rooms(5, 2, [3, 5, 4, 9, 10])
2

>>> min_rooms(5, 0, [1, 1, 1, 1, 1])
1

Implement `min_rooms(n: int, k: int, skill_levels: list[int]) -> int`.
