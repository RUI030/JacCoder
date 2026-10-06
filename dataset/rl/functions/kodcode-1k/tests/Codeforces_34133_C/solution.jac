"""
    Determines the finish time for each person in the queue.

    Args:
    n (int): Number of people in the queue.
    arrival_times (list): List of integers representing arrival times.
    durations (list): List of integers representing durations of the ride.

    Returns:
    list: List of integers representing the finish times for each person.
    """
def amusement_park_finish_times(n: int, arrival_times: list[int], durations: list[int]) -> list[int] {
    finish_times = [];
    current_time = 0;
    for i in range(n) {
        arrival_time = arrival_times[i];
        duration = durations[i];
        start_time = max(current_time, arrival_time);
        finish_time = start_time + duration;
        current_time = finish_time;
        finish_times.append(finish_time);
    }
    return finish_times;
}

