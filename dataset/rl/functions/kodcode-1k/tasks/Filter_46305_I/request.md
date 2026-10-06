# check_increasing_decreasing

Write a Jac function that checks if the elements of a given list are strictly increasing or decreasing, with a special condition that identical consecutive elements are allowed only if they are the first two elements in the sequence and are 1s. Return `True` if these conditions are met, otherwise `False`. For example, `[1, 1, 2, 3]` should return `True`, but `[2, 2, 3, 4]` and `[1, 2, 2, 3]` should return `False`.

Example:
- `check_increasing_decreasing([1]) == True`

Implement `check_increasing_decreasing(lst: list[int]) -> bool`.
