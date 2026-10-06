# factor_pairs

Returns a list of all unique pairs of factors of `n` excluding (1, n) and (n, 1).
A pair (a, b) is considered a factor pair of `n` if:
- `a * b = n`
- `1 < a <= b < n`

The pairs should be listed in ascending order based on the first element of the pair.
If there are no such pairs, return an empty list.

>>> factor_pairs(12)
[(2, 6), (3, 4)]
>>> factor_pairs(28)
[(2, 14), (4, 7)]

Implement `factor_pairs(n: int) -> list[tuple[int, int]]`.
