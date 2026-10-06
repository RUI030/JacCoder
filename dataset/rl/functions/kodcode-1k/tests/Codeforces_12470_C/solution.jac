"""
    Determines if the instructor is well-received based on student scores.

    Parameters:
    n (int): The number of students who participated in the survey.
    scores (list of int): The scores given by the students.

    Returns:
    str: "Well-received" if at least 70% of the students rated the instructor 7 or higher,
         otherwise "Needs Improvement".
    """
def instructor_feedback(n: int, scores: list[int]) -> str {
    high_scores = [
        score
        for score in scores
        if (score >= 7)
    ];
    if ((len(high_scores) / n) >= 0.7) {
        return "Well-received";
    } else {
        return "Needs Improvement";
    }
}

