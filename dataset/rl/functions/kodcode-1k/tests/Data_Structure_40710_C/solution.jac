import from typing { Any }
import from typing { List, Tuple }
"""
    Merges all overlapping booking intervals.

    Args:
    bookings (List[Tuple[int, int]]): The list of booking intervals.

    Returns:
    List[Tuple[int, int]]: The list of merged intervals.
    """
def merge_bookings(bookings: list[tuple[int, int]]) -> list[tuple[int, int]] {
    if not bookings {
        return [];
    }
    bookings.sort(key=lambda (x: Any) { x[0]; });
    merged = [];
    (current_start, current_end) = bookings[0];
    for (start, end) in bookings[1:] {
        if (start <= current_end) {
            current_end = max(current_end, end);
        } else {
            merged.append((current_start, current_end));
            (current_start, current_end) = (start, end);
        }
    }
    merged.append((current_start, current_end));
    return merged;
}

