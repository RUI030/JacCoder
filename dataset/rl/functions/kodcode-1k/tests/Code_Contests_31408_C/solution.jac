"""
    Determines the total points of Alex and Bob and declares the winner.

    Parameters:
    a (int): Total points Alex scored on problems he and Bob both solved
    b (int): Total points Bob scored on problems he and Alex both solved
    c (int): Total points Alex scored on problems only he solved
    d (int): Total points Bob scored on problems only he solved

    Returns:
    tuple: Total points of Alex, total points of Bob, and the winner ("Alex", "Bob", or "Draw")
    """
def get_winner(a: int, b: int, c: int, d: int) -> tuple[int, int, str] {
    alex_points = a + c;
    bob_points = b + d;
    if (alex_points > bob_points) {
        winner = "Alex";
    } elif (bob_points > alex_points) {
        winner = "Bob";
    } else {
        winner = "Draw";
    }
    return (alex_points, bob_points, winner);
}

