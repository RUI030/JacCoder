# final_number_after_transformations

Determine the final number that remains after performing all possible transformations on each sequence.

>>> final_number_after_transformations(3, [
...    (5, [3, 5, 2, 4, 1]), 
...    (4, [7, 7, 7, 7]), 
...    (6, [1, 8, 6, 7, 5, 3])
... ]) 
[5, 7, 8]

>>> final_number_after_transformations(2, [
...    (3, [1, 2, 3]), 
...    (2, [4, 4])
... ]) 
[3, 4]

Implement `final_number_after_transformations(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int]`.
