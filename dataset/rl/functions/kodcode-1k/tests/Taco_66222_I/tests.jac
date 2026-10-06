import from main { rotate_right }

test "case 0" {
    want = [4, 5, 6, 1, 2, 3];
    got = rotate_right([1, 2, 3, 4, 5, 6], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = rotate_right([1], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [3, 1, 2];
    got = rotate_right([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4];
    got = rotate_right([1, 2, 3, 4], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = rotate_right([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4];
    got = rotate_right([1, 2, 3, 4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3];
    got = rotate_right([1, 2, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}
