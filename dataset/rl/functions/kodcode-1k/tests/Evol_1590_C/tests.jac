import from main { smallest_repeated_number }

test "case 0" {
    want = None;
    got = smallest_repeated_number([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = smallest_repeated_number([2, 3, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = smallest_repeated_number([4, 2, 3, 4, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = smallest_repeated_number([1, 1, 2, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = smallest_repeated_number([9, 8, 7, 6, 5, 7, 3, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = smallest_repeated_number([10, -1, -2, -1, 3, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = smallest_repeated_number([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = None;
    got = smallest_repeated_number([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
