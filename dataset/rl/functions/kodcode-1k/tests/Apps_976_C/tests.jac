import from main { shiftZeroesToEnd }

test "case 0" {
    want = [1, 3, 12, 0, 0];
    got = shiftZeroesToEnd([0, 1, 0, 3, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 0, 0];
    got = shiftZeroesToEnd([0, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 2, 4, 3, 5, 1, 0, 0, 0];
    got = shiftZeroesToEnd([4, 2, 4, 0, 3, 0, 5, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = shiftZeroesToEnd([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 0, 0, 0];
    got = shiftZeroesToEnd([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 0, 0, 0];
    got = shiftZeroesToEnd([0, 0, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 0, 0, 0];
    got = shiftZeroesToEnd([1, 0, 0, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
