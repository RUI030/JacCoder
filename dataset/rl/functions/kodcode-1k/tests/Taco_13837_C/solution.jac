"""
    Returns "YES" if the sequence is "good", otherwise "NO".

    A sequence is "good" if it can be split into two non-empty subsequences
    such that the sum of the elements in both subsequences is equal.
    """
def is_good_sequence(n: int, sequence: list[int]) -> str {
    total_sum = sum(sequence);
    if ((total_sum % 2) != 0) {
        return "NO";
    }
    target_sum = total_sum // 2;
    possible_sums = `set([0]);
    for num in sequence {
        new_sums = `set();
        for s in possible_sums {
            new_sums.add((s + num));
        }
        possible_sums.update(new_sums);
        if (target_sum in possible_sums) {
            return "YES";
        }
    }
    return "NO";
}

