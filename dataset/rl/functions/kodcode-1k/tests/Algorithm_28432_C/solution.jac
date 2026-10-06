import from typing { List }
"""
    Determines the minimum number of boxes required to ship all items based on the given weights
    and the maximum weight capacity of each box.
    """
def min_boxes(weights: list[int], max_weight: int) -> int {
    current_weight = 0;
    box_count = 0;
    for weight in weights {
        if ((current_weight + weight) <= max_weight) {
            current_weight += weight;
        } else {
            box_count += 1;
            current_weight = weight;
        }
    }
    if (current_weight > 0) {
        box_count += 1;
    }
    return box_count;
}

