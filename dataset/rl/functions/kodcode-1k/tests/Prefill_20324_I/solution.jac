import itertools;
"""
    Generates all possible combinations of the characters in the string s.

    :param s: Input string
    :return: List of all possible combinations
    """
def generate_combinations(s: str) -> list[str] {
    if not s {
        return [];
    }
    combinations = [];
    for r in range(1, (len(s) + 1)) {
        combinations.extend([''.join(comb) for comb in itertools.combinations(s, r)]);
    }
    return combinations;
}

