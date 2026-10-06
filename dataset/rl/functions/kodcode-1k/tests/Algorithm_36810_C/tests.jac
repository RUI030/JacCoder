import from main { minimum_bribes }

test "case 0" {
    want = 3;
    got = minimum_bribes([2, 1, 5, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = minimum_bribes([2, 5, 1, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = minimum_bribes([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = minimum_bribes([5, 2, 1, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = minimum_bribes([3, 1, 2, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = minimum_bribes([1, 3, 4, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = minimum_bribes([3, 1, 2, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = minimum_bribes([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = minimum_bribes([1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = minimum_bribes([4, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = minimum_bribes([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = minimum_bribes([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 3;
    got = minimum_bribes([3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
