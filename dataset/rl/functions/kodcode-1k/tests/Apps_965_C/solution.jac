import from typing { Any }
import from collections { Counter }
"""
    Returns the k most frequent elements in the array `arr`.
    If multiple elements have the same frequency, the smaller element comes first.
    """
def k_most_frequent_elements(arr: list[int], k: int) -> list[int] {
    freq = Counter(arr);
    sorted_elements = sorted(freq.keys(), key=lambda (x: Any) { (-freq[x], x); });
    return sorted_elements[:k];
}

