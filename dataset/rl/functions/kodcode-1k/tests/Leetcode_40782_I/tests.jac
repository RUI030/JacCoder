import from main { sorted_squares }

test "case 0" {
    want = [1, 4, 9, 16, 25];
    got = sorted_squares([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 4, 9, 16, 25];
    got = sorted_squares([-5, -4, -3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1, 4, 9, 16];
    got = sorted_squares([-3, -1, 0, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0];
    got = sorted_squares([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4];
    got = sorted_squares([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4];
    got = sorted_squares([-2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = sorted_squares([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
