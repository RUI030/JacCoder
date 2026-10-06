"""
    Process a list of votes on multiple issues and return the final counts
    for each option of every issue.

    Parameters:
    m (int): number of issues
    options (list of list of int): initial counts for each option of every issue
    votes (list of tuple of int): each vote represented as a tuple (a, b, c)

    Returns:
    list of list of int: final counts for each option of every issue
    """
def process_votes(m: int, options: list[list[int]], votes: list[tuple[int, int, int]]) -> list[list[int]] {
    for (a, b, c) in votes {
        options[(a - 1)][(b - 1)] += c;
    }
    return options;
}

