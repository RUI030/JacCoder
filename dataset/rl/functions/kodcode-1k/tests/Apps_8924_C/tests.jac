import from main { findCommonElements }

test "case 0" {
    want = [];
    got = findCommonElements([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 4];
    got = findCommonElements([1, 2, 2, 3, 4], [3, 4, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2];
    got = findCommonElements([1, 1, 2, 2], [1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [7, 9];
    got = findCommonElements([7, 8, 9], [9, 10, 11, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = findCommonElements([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = findCommonElements([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 4, 5];
    got = findCommonElements([1, 4, 5], [4, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
