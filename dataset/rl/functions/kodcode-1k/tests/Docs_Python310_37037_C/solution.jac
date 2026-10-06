import from typing { List, Tuple }
def count_bits_and_operate(int_list: list[int]) -> tuple[list[tuple[int, int]], int] {
    bit_counts = [(num, num.bit_count()) for num in int_list];
    filtered_odd = [
        num
        for (num, count) in bit_counts
        if ((count % 2) != 0)
    ];
    if not filtered_odd {
        return (bit_counts, 0);
    }
    cumulative_and = filtered_odd[0];
    for num in filtered_odd[1:] {
        cumulative_and &= num;
    }
    return (bit_counts, cumulative_and);
}

