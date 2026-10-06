import from typing { Any }
import from collections { Counter }
"""
    Returns the 'n' most frequent elements in the array.
    If there are multiple elements with the same frequency,
    the elements should be returned in ascending order.

    Parameters:
    - array: List[int]
    - n: int (number of most frequent elements to return)

    Returns:
    - List[int]: A list of the 'n' most frequent elements.
    """
def find_n_most_frequent_elements(array: list[int], n: int) -> list[int] {
    if ((n == 0) or not array) {
        return [];
    }
    freq_counter = Counter(array);
    most_common_elements = freq_counter.most_common();
    sorted_most_common_elements = sorted(
        most_common_elements, key=lambda (x: Any) { (-x[1], x[0]); }
    );
    return [elem[0] for elem in sorted_most_common_elements[:n]];
}

