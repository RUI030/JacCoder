# min_retrieval_actions

Returns the minimum number of retrieval actions required to fulfill all orders.
>>> min_retrieval_actions(4, [3, 4, 2, 5], ['S', 'M', 'S', 'M'])
2
>>> min_retrieval_actions(3, [5, 6, 3], ['L', 'L', 'L'])
1

Implement `min_retrieval_actions(m: int, quantities: list[int], sizes: list[str]) -> int`.
