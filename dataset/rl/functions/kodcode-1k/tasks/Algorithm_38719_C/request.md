# find_closest_match

Finds the player with the closest skill level to the target player's skill level.

Args:
player_skills (List[int]): List of skill levels of other players.
target_skill (int): Skill level of the target player.

Returns:
int: Skill level of the player closest to the target skill level.

Examples:
>>> find_closest_match([1500, 1700, 1600, 1800, 2000], 1650)
1600
>>> find_closest_match([1500], 1600)
1500

Implement `find_closest_match(player_skills: list[int], target_skill: int) -> int`.
