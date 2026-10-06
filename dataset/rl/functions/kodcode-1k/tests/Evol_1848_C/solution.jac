import from collections { Counter }
import from math { factorial }
"""
    Returns the number of distinct permutations of the characters in the string `s`.
    """
def count_distinct_permutations(s: str) -> int {
    counts = Counter(s);
    denominator = 1;
    for count in counts.values() {
        denominator *= factorial(count);
    }
    return (factorial(len(s)) // denominator);
}

