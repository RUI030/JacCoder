"""
    Inserts new_number into sorted_list while maintaining the order and removes any duplicates.

    :param sorted_list: List of numbers in increasing order
    :param new_number: New number to be inserted
    :return: New list with the number inserted and duplicates removed
    """
def insert_and_remove_duplicates(sorted_list: list[int], new_number: int) -> list[int] {
    sorted_list.append(new_number);
    sorted_list.sort();
    return sorted(`set(sorted_list));
}

