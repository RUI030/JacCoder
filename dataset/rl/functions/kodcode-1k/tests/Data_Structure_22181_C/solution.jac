"""
    Sorts the given list of integers using the Cocktail Shaker Sort algorithm.
    """
def cocktail_shaker_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    if (n <= 1) {
        return arr;
    }
    start = 0;
    end = n - 1;
    while (start < end) {
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
        end -= 1;
        swapped = False;
        for i in range(end, start, -1) {
            if (arr[i] < arr[(i - 1)]) {
                (arr[i], arr[(i - 1)]) = (arr[(i - 1)], arr[i]);
                swapped = True;
            }
        }
        if not swapped {
            break;
        }
        start += 1;
    }
    return arr;
}

