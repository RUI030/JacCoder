import from main { rotate_array }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = rotate_array([1, 2, 3, 4, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = rotate_array([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 5, 1, 2, 3];
    got = rotate_array([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 5, 1, 2, 3];
    got = rotate_array([1, 2, 3, 4, 5], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = rotate_array([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = rotate_array([1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
