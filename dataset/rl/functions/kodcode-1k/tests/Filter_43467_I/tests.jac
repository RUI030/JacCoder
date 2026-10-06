import from main { second_largest }

test "case 0" {
    want = 4;
    got = second_largest([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = second_largest([4, 4, 4, 2, 2, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = None;
    got = second_largest([7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = None;
    got = second_largest([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = second_largest([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 10;
    got = second_largest([10, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -2;
    got = second_largest([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = second_largest([5, 5, -5, 10, -1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
