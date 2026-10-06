def min_boxes(n: int, W: int, weights: list[int]) -> int {
    weights.sort(reverse=True);
    boxes = 0;
    while weights {
        capacity = W;
        i = 0;
        while (i < len(weights)) {
            if (weights[i] <= capacity) {
                capacity -= weights[i];
                weights.pop(i);
            } else {
                i += 1;
            }
        }
        boxes += 1;
    }
    return boxes;
}

