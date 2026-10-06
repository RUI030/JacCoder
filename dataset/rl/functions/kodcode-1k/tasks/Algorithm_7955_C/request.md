# running_average

Calculate the running average over a specified window size for a given list of numbers.

Parameters:
data (list): A list of real numbers representing the incoming data stream.
window_size (int): The size of the moving window over which to compute the average.

Returns:
list: A list where each element is the average of the current window of values.

>>> running_average([1, 2, 3, 4, 5], 3)
[1.0, 1.5, 2.0, 3.0, 4.0]

>>> running_average([10, 20, 30, 40, 50], 2)
[10.0, 15.0, 25.0, 35.0, 45.0]

Implement `running_average(data: list[int], window_size: int) -> list[float]`.
