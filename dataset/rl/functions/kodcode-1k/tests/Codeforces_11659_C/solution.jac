def is_well_balanced(n: int, s: str) -> str {
    count_A = 0;
    count_B = 0;
    count_C = 0;
    for char in s {
        if (char == 'A') {
            count_A += 1;
        } elif (char == 'B') {
            count_B += 1;
        } elif (char == 'C') {
            count_C += 1;
        }
        max_count = max(count_A, count_B, count_C);
        min_count = min(count_A, count_B, count_C);
        if ((max_count - min_count) > 1) {
            return "NO";
        }
    }
    return "YES";
}

