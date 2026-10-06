# grade_exam

### Problem Statement

To assist in developing an automated grading system for multiple-choice exams, you need to write a function that evaluates a student's answer sheet against an answer key.

Create a function `grade_exam(answer_key: List[str], student_answers: List[str]) -> int` that takes two lists of strings, `answer_key` and `student_answers`, as inputs and returns an integer representing the student's score. Each correct answer earns the student 1 point, while incorrect answers do not affect the score.

### Input
- Two lists of strings `answer_key` and `student_answers` where:
  - `answer_key` contains the correct answers to the exam.
  - `student_answers` contains the student's answers to the exam.
  - Both lists will be of the same length, representing the number of questions in the exam.
  - Each element in the lists will be a string representing the answer to a question (e.g., "A", "B", "C", "D").

### Output
- The function should return an integer representing the total score the student received.

### Constraints
- Both `answer_key` and `student_answers` will have lengths between 1 and 100 inclusive.
- Each element in the lists will be one of the strings "A", "B", "C", or "D".

### Example
- `grade_exam(["A", "C", "B", "D"], ["A", "C", "D", "D"])` should return `3` because the student answered the first three questions correctly.

### Implementation Note
Ensure that your implementation accurately calculates the number of correct answers and appropriately handles variations in answers as specified in the lists.

Example:
- `grade_exam(['A', 'B', 'C', 'D'], ['A', 'B', 'C', 'D']) == 4`

Implement `grade_exam(answer_key: list[str], student_answers: list[str]) -> int`.
