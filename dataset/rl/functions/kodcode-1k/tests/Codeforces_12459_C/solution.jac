"""
    Calculate the score for a participant based on tasks completed and time taken.

    Args:
    tasks_completed (int): The number of tasks successfully completed.
    time_taken (float): The total time taken in hours.

    Returns:
    float: The calculated score for the participant.
    """
def calculate_score(tasks_completed: int, time_taken: float) -> float {
    points_per_task = 100;
    deduction_per_hour = 10;
    score = (tasks_completed * points_per_task) - (time_taken * deduction_per_hour);
    return max(score, 0);
}

