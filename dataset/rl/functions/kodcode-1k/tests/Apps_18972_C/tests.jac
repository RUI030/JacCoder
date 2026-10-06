import from main { trap }

test "case 0" {
    want = 0;
    got = trap([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = trap([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = trap([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = trap([2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = trap([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = trap([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 7;
    got = trap([3, 0, 2, 0, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 9;
    got = trap([4, 2, 0, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
