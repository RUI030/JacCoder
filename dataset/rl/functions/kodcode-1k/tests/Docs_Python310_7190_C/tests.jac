import from main { sum_and_diff }

test "case 0" {
    want = (8, 2);
    got = sum_and_diff(5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (-8, 2);
    got = sum_and_diff(-5, -3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (-2, 8);
    got = sum_and_diff(-5, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (5, 5);
    got = sum_and_diff(0, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (5, 5);
    got = sum_and_diff(5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
