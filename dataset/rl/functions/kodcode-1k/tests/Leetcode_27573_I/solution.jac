"""
    Evaluates the given expression string 's' and returns the result as an integer.
    """
def calculate_expression(s: str) -> int {
    total = 0;
    current_number = 0;
    sign = 1;
    for char in s {
        if char.isdigit() {
            current_number = (current_number * 10) + int(char);
        } elif (char == '+') {
            total += current_number * sign;
            sign = 1;
            current_number = 0;
        } elif (char == '-') {
            total += current_number * sign;
            sign = -1;
            current_number = 0;
        }
    }
    total += current_number * sign;
    return total;
}

