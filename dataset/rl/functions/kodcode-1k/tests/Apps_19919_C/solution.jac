import from itertools { permutations }
"""
    Return all unique permutations of the string s sorted in lexicographical order.
    """
def find_permutations(s: str) -> list[str] {
    unique_permutations = sorted(`set(permutations(s)));
    return [''.join(p) for p in unique_permutations];
}

