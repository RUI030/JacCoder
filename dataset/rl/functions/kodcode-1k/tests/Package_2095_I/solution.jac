import from typing { Any }
import from collections { Counter }
"""
    Sorts an array of integers based on the frequency of values.
    More frequent numbers appear earlier. If frequencies are equal,
    the numbers appear in ascending order.
    """
def frequency_sort(arr: list[int]) -> list[int] {
    frequency = Counter(arr);
    sorted_arr = sorted(arr, key=lambda (x: Any) { (-frequency[x], x); });
    return sorted_arr;
}

