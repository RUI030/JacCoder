"""
    Determines the maximum number of balanced teams that can be formed.

    :param n: Number of participants
    :param d: Maximum allowed skill difference in a team
    :param skill_levels: List of skill levels of the participants
    :return: Maximum number of balanced teams
    """
def max_balanced_teams(n: int, d: int, skill_levels: list[int]) -> int {
    skill_levels.sort();
    teams_count = 0;
    i = 0;
    while ((i + 3) < n) {
        if ((skill_levels[(i + 3)] - skill_levels[i]) <= d) {
            teams_count += 1;
            i += 4;
        } else {
            i += 1;
        }
    }
    return teams_count;
}

