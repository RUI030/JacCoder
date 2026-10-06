import from itertools { permutations }
"""
    Function to check if it is possible to arrange the balloons such that no two consecutive balloons have the same color at any segment position.
    :param n: Number of balloons
    :param balloons: List of balloon color segment strings
    :return: "YES" if arrangement possible, "NO" otherwise
    """
def canArrangeBalloons(n: int, balloons: list[str]) -> str {
    for perm in permutations(balloons) {
        valid = True;
        for i in range((n - 1)) {
            for j in range(len(balloons[i])) {
                if (perm[i][j] == perm[(i + 1)][j]) {
                    valid = False;
                    break;
                }
            }
            if not valid {
                break;
            }
        }
        if valid {
            return "YES";
        }
    }
    return "NO";
}

