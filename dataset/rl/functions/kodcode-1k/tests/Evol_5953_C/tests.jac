import from main { sortedArraySquares }

test "case 0" {
    want = [1, 4, 9, 16];
    got = sortedArraySquares([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 4, 9, 16];
    got = sortedArraySquares([-4, -3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1, 9, 16, 100];
    got = sortedArraySquares([-4, -1, 0, 3, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 4, 9];
    got = sortedArraySquares([0, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1, 4];
    got = sortedArraySquares([-2, -1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = sortedArraySquares([-1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4];
    got = sortedArraySquares([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = sortedArraySquares([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
