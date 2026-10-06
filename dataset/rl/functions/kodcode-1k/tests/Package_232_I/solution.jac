"""
    Returns a list of average values of each contiguous sub-list of length k in the input list.
    """
def segment_avg(data: list[int], k: int) -> list[float] {
    if ((k <= 0) or (len(data) < k)) {
        return [];
    }
    averages = [];
    for i in range(((len(data) - k) + 1)) {
        sub_list = data[i:(i + k)];
        avg = sum(sub_list) / k;
        averages.append(avg);
    }
    return averages;
}

