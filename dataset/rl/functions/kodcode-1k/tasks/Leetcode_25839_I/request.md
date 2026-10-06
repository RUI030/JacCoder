# round_grades

You are given a list of integers representing grades of students in a class. Your task is to implement a function that rounds each student's grade according to the following rules: 
1. If the difference between the grade and the next multiple of 5 is less than 3, round the grade up to the next multiple of 5.
2. If the value of the grade is less than 38, no rounding occurs as the grade is failing.

Write a function that takes a list of integers as input and returns a list of integers representing the rounded grades.

Example:
- `round_grades([33, 37]) == [33, 37]`

Implement `round_grades(grades: list[int]) -> list[int]`.
