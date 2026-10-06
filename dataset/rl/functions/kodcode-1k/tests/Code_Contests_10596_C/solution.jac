"""
    Determine if a knight can move from (x1, y1) to (x2, y2) in one move
    """
def can_knight_move(x1: int, y1: int, x2: int, y2: int) -> str {
    possible_moves = [
        ((x1 + 2), (y1 + 1)),
        ((x1 + 2), (y1 - 1)),
        ((x1 - 2), (y1 + 1)),
        ((x1 - 2), (y1 - 1)),
        ((x1 + 1), (y1 + 2)),
        ((x1 + 1), (y1 - 2)),
        ((x1 - 1), (y1 + 2)),
        ((x1 - 1), (y1 - 2))
    ];
    return "YES" if ((x2, y2) in possible_moves) else "NO";
}

