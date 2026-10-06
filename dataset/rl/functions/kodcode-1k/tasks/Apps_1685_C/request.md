# isMountainArray

Given an array of integers, determine whether the array is a perfect mountain array.
An array is considered a perfect mountain if there is its peak element at index `k` (0 < k < n - 1), such that:
- Elements strictly increase from the start of the array to the peak (`arr[0] < arr[1] < ... < arr[k]`).
- Elements strictly decrease from the peak to the end of the array (`arr[k] > arr[k+1] > ... > arr[n-1]`).

>>> isMountainArray([0, 2, 3, 4, 5, 2, 1, 0])
True
>>> isMountainArray([0, 2, 3, 3, 5, 2, 1, 0])
False

Implement `isMountainArray(arr: list[int]) -> bool`.
