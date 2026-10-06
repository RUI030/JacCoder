"""
    Takes a list of integers and returns a dictionary summarizing the list's elements.

    :param lst: List of integers
    :return: Dictionary with counts of 'positive', 'negative', 'zero', 'even', 'odd', and the 'sum' of the list
    """
def summarize_list_elements(lst: list[int]) -> dict[str, int] {
    summary = {'positive': 0, 'negative': 0, 'zero': 0, 'even': 0, 'odd': 0, 'sum': 0};
    for num in lst {
        if (num > 0) {
            summary['positive'] += 1;
        } elif (num < 0) {
            summary['negative'] += 1;
        } else {
            summary['zero'] += 1;
        }
        if ((num % 2) == 0) {
            summary['even'] += 1;
        } else {
            summary['odd'] += 1;
        }
        summary['sum'] += num;
    }
    return summary;
}

