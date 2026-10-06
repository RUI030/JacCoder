import from main { sorted_squares }

test "case 0" {
    want = [0, 1, 9, 16, 100];
    got = sorted_squares([-4, -1, 0, 3, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 9, 9, 49, 121];
    got = sorted_squares([-7, -3, 2, 3, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [25];
    got = sorted_squares([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [25];
    got = sorted_squares([-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 9, 36, 64];
    got = sorted_squares([-8, -6, -3, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 4, 9, 16];
    got = sorted_squares([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [0, 0, 1, 1, 4, 4];
    got = sorted_squares([0, -1, -2, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
