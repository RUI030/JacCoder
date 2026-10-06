"""
    Prints the FizzBuzz sequence up to a given number n.

    For multiples of 3, prints "Fizz".
    For multiples of 5, prints "Buzz".
    For multiples of both 3 and 5, prints "FizzBuzz".
    For all other numbers, prints the number itself.
    """
def fizzbuzz(n: int) -> list[str] {
    result = [];
    for i in range(1, (n + 1)) {
        if (((i % 3) == 0) and ((i % 5) == 0)) {
            result.append("FizzBuzz");
        } elif ((i % 3) == 0) {
            result.append("Fizz");
        } elif ((i % 5) == 0) {
            result.append("Buzz");
        } else {
            result.append(str(i));
        }
    }
    return result;
}

