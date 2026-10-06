# convert_and_check_boolean

Converts an integer to its boolean equivalent and checks if the input is a boolean.

Parameters:
value (int): The input value to be converted and checked.

Returns:
tuple: A tuple containing the boolean equivalent of the input and a boolean indicating
       if the input is a boolean.

>>> convert_and_check_boolean(0)
(False, False)
>>> convert_and_check_boolean(1)
(True, False)

Implement `convert_and_check_boolean(value: int) -> tuple[bool, bool]`.
