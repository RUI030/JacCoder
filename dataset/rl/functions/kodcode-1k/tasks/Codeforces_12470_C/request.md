# instructor_feedback

Determines if the instructor is well-received based on student scores.

Parameters:
n (int): The number of students who participated in the survey.
scores (list of int): The scores given by the students.

Returns:
str: "Well-received" if at least 70% of the students rated the instructor 7 or higher, 
     otherwise "Needs Improvement".

Examples:
>>> instructor_feedback(5, [8, 7, 6, 9, 10])
'Well-received'
>>> instructor_feedback(5, [5, 6, 4, 6, 6])
'Needs Improvement'

Implement `instructor_feedback(n: int, scores: list[int]) -> str`.
