"""
    This function returns the number of distinct teams that can be formed
    such that each team consists of exactly three students and the maximum
    difference in skill levels between any two students in a team is no more than 5.

    Args:
    skill_levels (list): List of integers representing the skill levels of the students.

    Returns:
    int: Number of distinct teams that can be formed.
    """
def count_teams(skill_levels: list[int]) -> int {
    skill_levels.sort();
    n = len(skill_levels);
    team_count = 0;
    for i in range((n - 2)) {
        if ((skill_levels[(i + 2)] - skill_levels[i]) <= 5) {
            team_count += 1;
            skill_levels.pop((i + 2));
            skill_levels.pop((i + 1));
            skill_levels.pop(i);
            return (team_count + count_teams(skill_levels));
        }
    }
    return team_count;
}

