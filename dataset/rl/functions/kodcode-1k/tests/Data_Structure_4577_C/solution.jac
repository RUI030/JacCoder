"""
    Sorts an input list of integers in ascending order using the Cocktail Shaker Sort algorithm.

    Args:
    arr (List[int]): A list of integers that need to be sorted.

    Returns:
    List[int]: A sorted list in ascending order.
    """
def cocktail_shaker_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    if (n == 0) {
        return arr;
    }
    swapped = True;
    start = 0;
    end = n - 1;
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
        for i in range((end - 1), (start - 1), -1) {
            if (arr[i] > arr[(i + 1)]) {
                (arr[i], arr[(i + 1)]) = (arr[(i + 1)], arr[i]);
                swapped = True;
            }
        }
        start += 1;
    }
    return arr;
}

