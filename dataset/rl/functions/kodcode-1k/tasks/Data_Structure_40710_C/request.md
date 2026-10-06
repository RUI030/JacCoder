# merge_bookings

Merges all overlapping booking intervals.

Args:
bookings (List[Tuple[int, int]]): The list of booking intervals.

Returns:
List[Tuple[int, int]]: The list of merged intervals.

>>> merge_bookings([(1, 3), (2, 6), (8, 10), (15, 18)]) == [(1, 6), (8, 10), (15, 18)]
>>> merge_bookings([(1, 4), (4, 5)]) == [(1, 5)]

Implement `merge_bookings(bookings: list[tuple[int, int]]) -> list[tuple[int, int]]`.
