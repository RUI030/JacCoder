import from collections { Counter }
"""
    Returns the maximum number of teams that can be formed from the given participants.

    Parameters:
    n (int): The number of participants.
    k (int): The required number of members in each team.
    skills (list of int): The skill levels of each participant.

    Returns:
    int: The maximum number of teams that can be formed.
    """
def max_teams(n: int, k: int, skills: list[int]) -> int {
    skill_counts = Counter(skills);
    team_count = 0;
    while True {
        available_skills = 0;
        skill_counts_copy = skill_counts.copy();
        for skill in skill_counts_copy {
            if (skill_counts_copy[skill] > 0) {
                skill_counts[skill] -= 1;
                available_skills += 1;
                if (available_skills == k) {
                    break;
                }
            }
        }
        if (available_skills < k) {
            break;
        }
        team_count += 1;
    }
    return team_count;
}

