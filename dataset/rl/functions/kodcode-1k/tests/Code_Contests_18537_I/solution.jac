"""
    The function takes the number of people n and a list of their heights,
    then returns the final order of heights after the redistribution process.
    """
def redistribute_heights(n: int, heights: list[int]) -> list[int] {
    heights.sort();
    final_order = [];
    (left_pt, right_pt) = (0, (n - 1));
    while (left_pt <= right_pt) {
        if (right_pt > left_pt) {
            final_order.append(heights[right_pt]);
            final_order.append(heights[left_pt]);
        } elif (right_pt == left_pt) {
            final_order.append(heights[left_pt]);
        }
        right_pt -= 1;
        left_pt += 1;
    }
    return final_order;
}

