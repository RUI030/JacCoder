import from main { get_largest_number }

test "case 0" {
    want = 5;
    got = get_largest_number([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = get_largest_number([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = get_largest_number([-1, 2, -3, 4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 42;
    got = get_largest_number([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = get_largest_number([1, 2, 3, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = None;
    got = get_largest_number([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = get_largest_number([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
