"""
    Sorts a list of numbers using the insertion sort algorithm.

    Insertion sort is a simple sorting algorithm that works by building a sorted section of the list
    one element at a time. It iterates over the list, and for each element, it inserts it into its
    correct position within the sorted section of the list.

    Parameters:
    lst (list of int/float): The list of numbers to be sorted.

    Returns:
    list of int/float: A sorted version of the input list.
    """
def insertion_sort(lst: list[int]) -> list[int] {
    for i in range(1, len(lst)) {
        key = lst[i];
        j = i - 1;
        while ((j >= 0) and (key < lst[j])) {
            lst[(j + 1)] = lst[j];
            j -= 1;
        }
        lst[(j + 1)] = key;
    }
    return lst;
}

