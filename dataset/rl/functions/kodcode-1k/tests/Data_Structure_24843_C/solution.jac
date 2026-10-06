import from typing { List }
"""
    Function to find the most frequent values in the array.
    """
def most_frequent_values(arr: list[int]) -> list[int] {
    if not arr {
        return [];
    }
    frequency_dict = {};
    for num in arr {
        if (num in frequency_dict) {
            frequency_dict[num] += 1;
        } else {
            frequency_dict[num] = 1;
        }
    }
    max_frequency = max(frequency_dict.values());
    most_frequent = [
        key
        for (key, value) in frequency_dict.items()
        if (value == max_frequency)
    ];
    return most_frequent;
}

