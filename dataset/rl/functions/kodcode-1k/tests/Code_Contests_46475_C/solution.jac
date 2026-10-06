import from typing { List }
"""
    Given a list of integers representing the scores of students in an exam,
    returns the minimum number of operations required to make all scores equal.
    """
def min_operations_to_equalize(scores: list[int]) -> int {
    max_score = max(scores);
    operations = sum((max_score - score) for score in scores);
    return operations;
}

