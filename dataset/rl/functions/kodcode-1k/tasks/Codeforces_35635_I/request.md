# count_teams

You are a principal of a school where students have to form teams for an upcoming coding competition. Each team must have exactly three students, and the skill level of a team is defined as the sum of the skill levels of the three students in the team. To make the competition fairer, you decided that the maximum difference in skill levels between any two students in a team should be no more than 5.

Given a list of skill levels of students, determine the number of distinct teams that can be formed. Two teams are considered distinct if they have different students, even if they have the same total skill level.

The first line contains an integer n (3 ≤ n ≤ 100) — the number of students.

The second line contains n integers s1, s2, ..., sn (1 ≤ si ≤ 100) — the skill levels of the students.

Print a single integer — the number of distinct teams that can be formed.

For example:

Input:
5
4 5 6 10 15

Output:
1

Here, the only valid team is formed by students with skills [4, 5, 6], since the maximum difference in this team is 2. No other combination satisfies the conditions.

Example:
- `count_teams([4, 5, 6, 10, 15]) == 1`

Implement `count_teams(skill_levels: list[int]) -> int`.
