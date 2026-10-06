# custom_slice

Mimics Python's slice behavior by using provided start, stop, and step indices.
>>> custom_slice([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2, 8, 2) [3, 5, 7]
>>> custom_slice([10, 20, 30, 40, 50], None, 3, 1) [10, 20, 30]

Implement `custom_slice(input_list: list[int], start: int, stop: int, step: int) -> list[int]`.
