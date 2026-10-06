"""
    Evaluates a student's answer sheet against an answer key.

    Args:
    answer_key (list of str): The correct answers to the exam.
    student_answers (list of str): The student's answers to the exam.

    Returns:
    int: The student's score based on the number of correct answers.
    """
def grade_exam(answer_key: list[str], student_answers: list[str]) -> int {
    score = 0;
    for (correct, student) in zip(answer_key, student_answers) {
        if (correct == student) {
            score += 1;
        }
    }
    return score;
}

