"""
    Generates the first n terms of the look-and-say sequence.

    Parameters:
    n (int): the number of terms to generate

    Returns:
    list of str: the first n terms of the look-and-say sequence
    """
def look_and_say(n: int) -> list[str] {
    if (n <= 0) {
        return [];
    }
    result = ["1"];
    for _ in range((n - 1)) {
        current_term = result[-1];
        next_term = [];
        i = 0;
        while (i < len(current_term)) {
            count = 1;
            while (
                ((i + 1) < len(current_term))
                and (current_term[i] == current_term[(i + 1)])
            ) {
                i += 1;
                count += 1;
            }
            next_term.append((str(count) + current_term[i]));
            i += 1;
        }
        result.append(''.join(next_term));
    }
    return result;
}

