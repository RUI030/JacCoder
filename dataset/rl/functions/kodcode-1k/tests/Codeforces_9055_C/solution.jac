def max_paintings(n: int, S: int, widths: list[int]) -> int {
    widths.sort();
    total_width = 0;
    num_paintings = 0;
    for width in widths {
        if ((total_width + width) <= S) {
            total_width += width;
            num_paintings += 1;
        } else {
            break;
        }
    }
    return num_paintings;
}

