# num_unique_bst

Returns the number of unique BSTs that can be constructed with `n` unique nodes.
This is computed using the nth Catalan number.

Args:
n (int): The number of unique nodes (1 ≤ n ≤ 19).

Returns:
int: An integer representing the number of unique BSTs that can be constructed with `n` unique nodes.

Examples:
>>> num_unique_bst(3)
5
>>> num_unique_bst(5)
42

Implement `num_unique_bst(n: int) -> int`.
