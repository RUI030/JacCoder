# resolve_seat_conflicts

Resolves seat conflicts and returns the final seating arrangement in a stadium.

:param m: number of rows
:param n: number of columns
:param k: number of students
:param student_seats: list of tuples representing initially assigned seats
:return: a list of lists representing the final seating arrangement

>>> resolve_seat_conflicts(3, 3, 4, [(1, 1), (1, 1), (2, 2), (3, 3)])
[
    [1, 1, 0],
    [0, 1, 0],
    [0, 0, 1]
]
>>> resolve_seat_conflicts(1, 5, 3, [(1, 1), (1, 1), (1, 1)])
[
    [1, 1, 1, 0, 0]
]

Implement `resolve_seat_conflicts(m: int, n: int, k: int, student_seats: list[tuple[int, int]]) -> list[list[int]]`.
