"""
    Finds the player with the closest skill level to the target player's skill level.

    Args:
    player_skills (List[int]): List of skill levels of other players.
    target_skill (int): Skill level of the target player.

    Returns:
    int: Skill level of the player closest to the target skill level.
    """
def find_closest_match(player_skills: list[int], target_skill: int) -> int {
    closest_skill = player_skills[0];
    min_diff = abs((player_skills[0] - target_skill));
    for skill in player_skills[1:] {
        diff = abs((skill - target_skill));
        if ((diff < min_diff) or ((diff == min_diff) and (skill < closest_skill))) {
            closest_skill = skill;
            min_diff = diff;
        }
    }
    return closest_skill;
}

