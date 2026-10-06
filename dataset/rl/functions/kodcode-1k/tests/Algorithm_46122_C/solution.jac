import from typing { List }
"""
    Finds the missing number in a Fibonacci-like sequence.
    """
def find_missing(sequence: list[int]) -> int {
    n = len(sequence);
    for i in range(2, n) {
        if (sequence[i] != (sequence[(i - 1)] + sequence[(i - 2)])) {
            if (
                ((i - 2) > 0)
                and (
                    sequence[i]
                    == (sequence[(i - 2)] + sequence[(i - 1)] + sequence[(i - 3)])
                )
            ) {
                return (sequence[(i - 2)] + sequence[(i - 1)]);
            } else {
                return (sequence[(i - 1)] + sequence[(i - 2)]);
            }
        }
    }
    return 0;
}

