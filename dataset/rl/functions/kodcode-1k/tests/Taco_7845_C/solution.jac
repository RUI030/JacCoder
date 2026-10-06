"""
    Resolves seat conflicts and returns the final seating arrangement in a stadium.

    :param m: number of rows
    :param n: number of columns
    :param k: number of students
    :param student_seats: list of tuples representing initially assigned seats
    :return: a list of lists representing the final seating arrangement
    """
def resolve_seat_conflicts(m: int, n: int, k: int, student_seats: list[tuple[int, int]]) -> list[list[int]] {
    stadium = [[0 for _ in range(n)] for _ in range(m)];
    occupied = [];
    for seat in student_seats {
        (r, c) = seat;
        r -= 1;
        c -= 1;
        occupied.append((r, c));
    }
    for (r, c) in occupied {
        while (stadium[r][c] == 1) {
            c += 1;
            if (c == n) {
                c = 0;
                r += 1;
            }
            if (r == m) {
                r = 0;
            }
        }
        stadium[r][c] = 1;
    }
    return stadium;
}

