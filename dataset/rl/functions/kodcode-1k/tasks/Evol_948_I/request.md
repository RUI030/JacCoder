# constrained_sort

Given a list of unique positive integers, modify the function to apply specific operations to sort the list in ascending order. Each operation has certain constraints, and not all operations are required. Return the sorted list if feasible, otherwise, return the original list.

def constrained_sort(numbers):
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

    Example,

    constrained_sort([3, 4, 5, 1, 2]) ==> [1, 2, 3, 4, 5]
    constrained_sort([3, 7, 4, 1, 2]) ==> [1, 2, 3, 4, 7]
    constrained_sort([1, 2, 3, 5, 6]) ==> [1, 2, 3, 5, 6]
    constrained_sort([5, 4, 3, 1, 2]) ==> [1, 2, 3, 4, 5]

    """
    # Your code here

Example:
- `constrained_sort([3, 4, 5, 1, 2]) == [1, 2, 3, 4, 5]`

Implement `constrained_sort(numbers: list[int]) -> list[int]`.
