# normalize_grades

Normalizes grades such that the highest grade becomes 100 and others scale accordingly.

:param n: Number of students
:param student_grades: List of tuples containing student names and their grades
:return: List of tuples containing student names and their normalized grades

>>> normalize_grades(4, [("Alice", 75), ("Bob", 50), ("Charlie", 100), ("David", 80)])
[("Alice", 75.00), ("Bob", 50.00), ("Charlie", 100.00), ("David", 80.00)]

>>> normalize_grades(3, [("Elena", 40), ("Lucas", 80), ("Marie", 100)])
[("Elena", 40.00), ("Lucas", 80.00), ("Marie", 100.00)]

Implement `normalize_grades(n: int, student_grades: list[tuple[str, int]]) -> list[tuple[str, float]]`.
