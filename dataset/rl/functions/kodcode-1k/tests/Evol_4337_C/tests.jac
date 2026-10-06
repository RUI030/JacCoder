import from main { max_consecutive_sum }

test "case 0" {
    want = 9;
    got = max_consecutive_sum([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 12;
    got = max_consecutive_sum([5, 4, 3, 2, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = max_consecutive_sum([1, 2, 3, 4], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_consecutive_sum([1, 2, 3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_consecutive_sum([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_consecutive_sum([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_consecutive_sum([1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = max_consecutive_sum([1, 2, 3], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = max_consecutive_sum([5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -6;
    got = max_consecutive_sum([-1, -2, -3, -4, -5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -3;
    got = max_consecutive_sum([-5, -4, -3, -2, -1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = max_consecutive_sum([1, -2, 3, -4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 4;
    got = max_consecutive_sum([1, -2, 3, -4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
