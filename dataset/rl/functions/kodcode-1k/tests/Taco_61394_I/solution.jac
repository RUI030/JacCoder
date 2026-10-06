"""
    Determines if the given n puzzle pieces can be assembled to form a valid rectangle.

    :param n: Number of puzzle pieces
    :param pieces: List of tuple representing the width and height of each piece
    :return: "YES" if the pieces can form a valid rectangle, otherwise "NO"
    """
def can_form_rectangle(n: int, pieces: list[tuple[int, int]]) -> str {
    piece_count = {};
    for (w, h) in pieces {
        if ((w, h) in piece_count) {
            piece_count[(w, h)] += 1;
        } elif ((h, w) in piece_count) {
            piece_count[(h, w)] += 1;
        } else {
            piece_count[(w, h)] = 1;
        }
    }
    for count in piece_count.values() {
        if ((count % 2) != 0) {
            return "NO";
        }
    }
    return "YES";
}

