# max_consecutive_dishes

Returns the maximum number of consecutive dishes that can be prepared
starting from the first customer's request and the total preparation time.

Parameters:
n (int): The number of customer requests.
times (List[int]): The time it takes to prepare each dish.

Returns:
Tuple[int, int]: (max_dishes, total_time) where max_dishes is the maximum number of dishes
that can be prepared consecutively, and total_time is the total preparation time for
those dishes.

Example:
- `max_consecutive_dishes(5, [2, 3, 1, 4, 2]) == (5, 12)`

Implement `max_consecutive_dishes(n: int, times: list[int]) -> tuple[int, int]`.
