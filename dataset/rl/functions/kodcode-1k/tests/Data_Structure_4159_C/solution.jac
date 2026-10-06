import from typing { List }
"""
    Sorts a list of floating-point numbers between 0 and 1 in ascending order using bucket sort algorithm.
    """
def custom_bucket_sort(arr: list[float]) -> list[float] {
    if not arr {
        return [];
    }
    num_buckets = len(arr);
    buckets = [[] for _ in range(num_buckets)];
    for num in arr {
        index = int((num * num_buckets));
        buckets[index].append(num);
    }
    for bucket in buckets {
        bucket.sort();
    }
    sorted_arr = [];
    for bucket in buckets {
        sorted_arr.extend(bucket);
    }
    return sorted_arr;
}

