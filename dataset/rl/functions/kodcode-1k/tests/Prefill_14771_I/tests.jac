import from main { sum_in_range }

test "case 0" {
    want = 9;
    got = sum_in_range([1, 2, 3, 4, 5], 1, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 60;
    got = sum_in_range([10, 20, 30, 40], 0, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -6;
    got = sum_in_range([-1, -2, -3], 0, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = None;
    got = sum_in_range([1, 2, 3], 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = sum_in_range([1, 2, 3], 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = None;
    got = sum_in_range([1, 2, 3], -1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = sum_in_range([1, 2, 3], 0, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = None;
    got = sum_in_range([], 0, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = sum_in_range([1], 0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 20;
    got = sum_in_range([10, 20, 30], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
