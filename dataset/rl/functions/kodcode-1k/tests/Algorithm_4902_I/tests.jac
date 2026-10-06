import from main { rotate_array }

test "case 0" {
    want = [3, 4, 5, 1, 2];
    got = rotate_array([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [50, 60, 70, 10, 20, 30, 40];
    got = rotate_array([10, 20, 30, 40, 50, 60, 70], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [15, 25, 35];
    got = rotate_array([15, 25, 35], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = rotate_array([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 4, 5, 1, 2];
    got = rotate_array([1, 2, 3, 4, 5], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [100];
    got = rotate_array([100], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [100];
    got = rotate_array([100], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = rotate_array([], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [7, 7, 7, 7];
    got = rotate_array([7, 7, 7, 7], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
