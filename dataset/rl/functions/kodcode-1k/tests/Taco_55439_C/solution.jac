"""
    Function to find the maximum total count of cookies by picking two types.

    Parameters:
    cookies (list): List of number of cookies of each type

    Returns:
    int: The maximum total count of cookies by picking two types
    """
def max_cookie_sum(cookies: list[int]) -> int {
    if (len(cookies) < 2) {
        return 0;
    }
    first_max = second_max=-1;
    for num in cookies {
        if (num > first_max) {
            second_max = first_max;
            first_max = num;
        } elif (num > second_max) {
            second_max = num;
        }
    }
    return (first_max + second_max);
}

