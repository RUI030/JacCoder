"""
    Calculate the running average over a specified window size for a given list of numbers.

    Parameters:
    data (list): A list of real numbers representing the incoming data stream.
    window_size (int): The size of the moving window over which to compute the average.

    Returns:
    list: A list where each element is the average of the current window of values.
    """
def running_average(data: list[int], window_size: int) -> list[float] {
    if (not data or (window_size <= 0)) {
        return [];
    }
    result = [];
    running_sum = 0.0;
    for i in range(len(data)) {
        running_sum += data[i];
        if (i >= window_size) {
            running_sum -= data[(i - window_size)];
        }
        if (i >= (window_size - 1)) {
            result.append((running_sum / window_size));
        } else {
            result.append((running_sum / (i + 1)));
        }
    }
    return result;
}

