# min_boxes

Alice is a shipping manager for an e-commerce company. She needs to pack items into boxes for customer orders. Each box has a maximum weight capacity. Alice wants to distribute the items in such a way that the number of boxes used is minimized. Can you help her determine the minimum number of boxes required?

You are given n items, where the weight of the i-th item is wi. You are also given the maximum weight capacity of a box, W. Write a function that takes in the weights of the items and the maximum box capacity, and returns the minimum number of boxes needed to pack all the items.

Input:

The input consists of two lines:
1. The first line contains two integers n and W, where 1 ≤ n ≤ 1000 and 1 ≤ W ≤ 10^9.
2. The second line contains n integers w1, w2, ..., wn, where 1 ≤ wi ≤ W, representing the weights of the items.

Output:

Output a single integer, which is the minimum number of boxes required to pack all the items.

Examples:

Input:
5 10
2 3 7 8 1

Output:
3

Input:
4 5
4 2 2 3

Output:
3

Example:
- `min_boxes(5, 10, [2, 3, 7, 8, 1]) == 3`

Implement `min_boxes(n: int, W: int, weights: list[int]) -> int`.
