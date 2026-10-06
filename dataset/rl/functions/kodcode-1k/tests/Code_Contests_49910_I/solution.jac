"""
    Calculate the minimum additional time needed for each participant to complete all questions
    in all rounds within the given time limits.

    Parameters:
    n (int): Number of rounds in the quiz competition.
    t (int): Time required by a participant to answer one question.
    a (list of int): Number of questions in the i-th round.
    b (list of int): Time limit in seconds for the i-th round.

    Returns:
    int: Minimum additional time needed.
    """
def min_additional_time(n: int, t: int, a: list[int], b: list[int]) -> int {
    additional_time = 0;
    for i in range(n) {
        required_time = a[i] * t;
        if (required_time > b[i]) {
            additional_time = max(additional_time, (required_time - b[i]));
        }
    }
    return additional_time;
}

