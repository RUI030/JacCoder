# highest_student_scores

Given a list of tuples where the first element is a string representing the student's name and the second element is an integer representing the student's score,
return a dictionary where the keys are student names and the values are the highest score obtained by that student.

If the list is empty, return an empty dictionary.
If a student has multiple scores, ensure only the highest score is recorded.

Examples:
>>> highest_student_scores([("Alice", 92), ("Bob", 85), ("Alice", 98), ("Bob", 80)]) == {"Alice": 98, "Bob": 85}
>>> highest_student_scores([("Alice", 75), ("Bob", 85)]) == {"Alice": 75, "Bob": 85}

Implement `highest_student_scores(student_scores: list[tuple[str, int]]) -> dict[str, int]`.
