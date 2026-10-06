# calculate_score

Calculate the score for a participant based on tasks completed and time taken.

Args:
tasks_completed (int): The number of tasks successfully completed.
time_taken (float): The total time taken in hours.

Returns:
float: The calculated score for the participant.

Example:
>>> calculate_score(5, 2.5)
475.0
>>> calculate_score(3, 5.0)
250.0

Implement `calculate_score(tasks_completed: int, time_taken: float) -> float`.
