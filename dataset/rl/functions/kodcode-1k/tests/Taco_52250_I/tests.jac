import from main { count_distinct_in_subarrays }

test "case 0" {
    want = [3, 4, 4, 3];
    got = count_distinct_in_subarrays([1, 2, 1, 3, 4, 2, 3], 7, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 2, 3];
    got = count_distinct_in_subarrays([4, 1, 1, 3, 4], 5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = count_distinct_in_subarrays([1], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 1, 1, 1];
    got = count_distinct_in_subarrays([5, 5, 5, 5, 5], 5, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 3, 3];
    got = count_distinct_in_subarrays([1, 2, 3, 4, 5], 5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [5];
    got = count_distinct_in_subarrays([1, 2, 3, 4, 5], 5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [3];
    got = count_distinct_in_subarrays([1, 2, 3], 3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = count_distinct_in_subarrays([1, 2, 3], 3, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
