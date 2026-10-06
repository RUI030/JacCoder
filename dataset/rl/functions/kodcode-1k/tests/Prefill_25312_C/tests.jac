import from main { square_list }

test "case 0" {
    want = [1, 4, 9, 16];
    got = square_list([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 4, 9];
    got = square_list([0, 2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 4, 9, 16];
    got = square_list([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 4, 9, 16];
    got = square_list([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = square_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [25];
    got = square_list([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [49];
    got = square_list([-7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
