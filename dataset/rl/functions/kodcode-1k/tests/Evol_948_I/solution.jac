"""
    Given an unordered collection 'numbers' of N unique positive integers
    elements numbers[1], numbers[2], ..., numbers[N], determine if it's possible
    to sort the list in ascending order by applying these operations:

        1. Rotate the list to the left by any number of positions one or more times.
        2. Swap the first and last elements of the list, but only once.
        3. Remove exactly one element from the list, but only once.
        4. Double the value of any single element, but only once.

    Check if the sorted list can be achieved given these operations.
    Return the sorted list if feasible; otherwise, return the original list.
    An empty list should return an empty list.
    """
def constrained_sort(numbers: list[int]) -> list[int] {
    if not numbers {
        return [];
    }
    sorted_list = sorted(numbers);
    for i in range(len(numbers)) {
        rotated_list = numbers[i:] + numbers[:i];
        if (rotated_list == sorted_list) {
            return sorted_list;
        }
    }
    swapped_list = numbers[:];
    (swapped_list[0], swapped_list[-1]) = (swapped_list[-1], swapped_list[0]);
    if (sorted(swapped_list) == sorted_list) {
        return sorted_list;
    }
    for i in range(len(numbers)) {
        temp_list = numbers[:i] + numbers[(i + 1):];
        if (sorted(temp_list) == sorted(temp_list)) {
            return sorted_list;
        }
    }
    for i in range(len(numbers)) {
        doubled_list = numbers[:];
        doubled_list[i] *= 2;
        if (sorted(doubled_list) == sorted_list) {
            return sorted_list;
        }
    }
    return numbers;
}

