# min_boxes

Determines the minimum number of boxes required to ship all items based on the given weights
and the maximum weight capacity of each box.

>>> min_boxes([10, 20, 30, 40, 50], 50)
4
>>> min_boxes([10, 10, 10, 10, 10, 10], 50)
2

Implement `min_boxes(weights: list[int], max_weight: int) -> int`.
