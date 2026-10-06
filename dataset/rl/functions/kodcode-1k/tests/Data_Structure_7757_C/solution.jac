"""
    Perform an optimized cocktail shaker sort on the input list.
    """
def optimized_cocktail_shaker_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    start = 0;
    end = n - 1;
    while True {
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
        if not swapped {
            break;
        }
        start += 1;
    }
    return arr;
}

