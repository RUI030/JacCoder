"""
    Sorts a list of integers using the Cocktail Shaker Sort algorithm.

    Args:
    arr (list): A list of integers to be sorted.

    Returns:
    list: The sorted list in non-decreasing order.
    """
def cocktail_shaker_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    if (n < 2) {
        return arr;
    }
    start = 0;
    end = n - 1;
    swapped = True;
    while swapped {
        swapped = False;
        for i in range(start, end) {
            if (arr[i] > arr[(i + 1)]) {
                (arr[i], arr[(i + 1)]) = (arr[(i + 1)], arr[i]);
                swapped = True;
            }
        }
        if not swapped {
            break;
        }
        swapped = False;
        end -= 1;
        for i in range(end, start, -1) {
            if (arr[i] < arr[(i - 1)]) {
                (arr[i], arr[(i - 1)]) = (arr[(i - 1)], arr[i]);
                swapped = True;
            }
        }
        start += 1;
    }
    return arr;
}

