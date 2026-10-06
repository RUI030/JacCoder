"""
    Given a list of mountain segments, compute the maximum length of the journey
    that can be achieved without crossing the same mountain segment more than once.
    """
def max_mountain_journey(mountains: list[tuple[int, int]]) -> int {
    mountains.sort();
    max_length = 0;
    current_end = 0;
    current_length = 0;
    for (li, ri) in mountains {
        if (li > current_end) {
            max_length += current_length;
            current_end = ri;
            current_length = ri - li;
        } elif (ri > current_end) {
            current_length += ri - current_end;
            current_end = ri;
        }
    }
    max_length += current_length;
    return max_length;
}

