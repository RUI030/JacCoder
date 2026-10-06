"""
    Identifies whether a number is EVEN or ODD.
    """
def identify_even_odd(number: int) -> str {
    if ((number % 2) == 0) {
        return "EVEN";
    } else {
        return "ODD";
    }
}

