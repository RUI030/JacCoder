import from main { min_odd_subarrays }

test "case 0" {
    want = -1;
    got = min_odd_subarrays([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = min_odd_subarrays([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_odd_subarrays([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_odd_subarrays([2, 3, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = min_odd_subarrays([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_odd_subarrays([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
