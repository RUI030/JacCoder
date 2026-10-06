# is_strictly_decreasing_possible

Determines if it is possible to make the heights of students strictly decreasing from left to right
by reducing any student's height by 1 unit any number of times.

Parameters:
- N: an integer representing the number of students
- heights: a list of integers representing the heights of the students

Returns:
- 'Possible' or 'Impossible' depending on whether the sequence can be made strictly decreasing

>>> is_strictly_decreasing_possible(4, [4, 3, 2, 1]) 
'Possible'
>>> is_strictly_decreasing_possible(5, [5, 5, 5, 4, 3]) 
'Impossible'

Implement `is_strictly_decreasing_possible(N: int, heights: list[int]) -> str`.
