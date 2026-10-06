import from typing { List }
"""
    Sorts a list of integers using the Gnome Sort algorithm.
    """
def gnome_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    index = 0;
    while (index < n) {
        if ((index == 0) or (arr[index] >= arr[(index - 1)])) {
            index += 1;
        } else {
            (arr[index], arr[(index - 1)]) = (arr[(index - 1)], arr[index]);
            index -= 1;
        }
    }
    return arr;
}

