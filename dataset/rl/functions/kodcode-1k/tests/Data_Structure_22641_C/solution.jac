import from typing { List, Tuple }
def gnome_sort_count_swaps(arr: list[int]) -> tuple[list[int], int] {
    index = 0;
    swaps = 0;
    while (index < len(arr)) {
        if ((index == 0) or (arr[index] >= arr[(index - 1)])) {
            index += 1;
        } else {
            (arr[index], arr[(index - 1)]) = (arr[(index - 1)], arr[index]);
            swaps += 1;
            index -= 1;
        }
    }
    return (arr, swaps);
}

