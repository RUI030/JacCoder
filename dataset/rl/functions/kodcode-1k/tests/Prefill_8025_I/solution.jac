"""
    Returns the sum of overlapping bits in two given arrays of binary strings.
    """
def sum_of_overlapping_bits(arr1: list[str], arr2: list[str]) -> int {
    if (not arr1 or not arr2) {
        return 0;
    }
    min_length = min(len(arr1), len(arr2));
    overlap_sum = 0;
    for i in range(min_length) {
        binary_str1 = arr1[i];
        binary_str2 = arr2[i];
        for (bit1, bit2) in zip(binary_str1, binary_str2) {
            if (bit1 == bit2) {
                overlap_sum += 1;
            }
        }
    }
    return overlap_sum;
}

