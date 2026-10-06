import from typing { Any }
import from collections { Counter }
"""
    This function takes the number of elements 'n', the number of most frequent elements 'k'
    to find, and the list of elements 'elements'. It returns the k most frequent elements
    sorted by frequency first (higher to lower) and then by value (lower to higher) for ties.
    """
def k_most_frequent(n: int, k: int, elements: list[int]) -> list[int] {
    frequency = Counter(elements);
    sorted_elements = sorted(frequency.items(), key=lambda (x: Any) { (-x[1], x[0]); });
    result = [elem[0] for elem in sorted_elements[:k]];
    return result;
}

