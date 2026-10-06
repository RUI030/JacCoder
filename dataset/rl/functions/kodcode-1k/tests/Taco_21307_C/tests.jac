import from main { max_sum_of_non_overlapping_positive_subarrays }

test "case 0" {
    want = 8;
    got = max_sum_of_non_overlapping_positive_subarrays([1, -2, 3, 4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_sum_of_non_overlapping_positive_subarrays([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 15;
    got = max_sum_of_non_overlapping_positive_subarrays([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = max_sum_of_non_overlapping_positive_subarrays([1, -1, 2, -2, 3, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = max_sum_of_non_overlapping_positive_subarrays([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_sum_of_non_overlapping_positive_subarrays([-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_sum_of_non_overlapping_positive_subarrays([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10;
    got = max_sum_of_non_overlapping_positive_subarrays([0, 1, 2, 0, 3, 4, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
