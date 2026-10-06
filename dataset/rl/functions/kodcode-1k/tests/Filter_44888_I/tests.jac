import from main { second_largest }

test "case 0" {
    want = 4;
    got = second_largest([1, 3, 4, 5, 0, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = second_largest([4, 4, 4, 3, 3, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -2;
    got = second_largest([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = None;
    got = second_largest([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = second_largest([3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = second_largest([1, -1, 0, 2, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = second_largest([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
