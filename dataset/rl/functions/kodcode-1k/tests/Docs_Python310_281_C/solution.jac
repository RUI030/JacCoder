"""
    Converts an integer to its boolean equivalent and checks if the input is a boolean.

    Parameters:
    value (int): The input value to be converted and checked.

    Returns:
    tuple: A tuple containing the boolean equivalent of the input and a boolean indicating
           if the input is a boolean.
    """
def convert_and_check_boolean(value: int) -> tuple[bool, bool] {
    boolean_equivalent = False if (value == 0) else True;
    is_boolean = (value is True) or (value is False);
    return (boolean_equivalent, is_boolean);
}

