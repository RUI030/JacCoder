import from typing { Any }
"""
    Sorts a list of tuples by the scores first in descending order,
    and then by names in alphabetical order in case of ties.
    """
def sort_by_score(records: list[tuple[str, int]]) -> list[str] {
    sorted_records = sorted(records, key=lambda (x: Any) { (-x[1], x[0]); });
    sorted_names = [record[0] for record in sorted_records];
    return sorted_names;
}

