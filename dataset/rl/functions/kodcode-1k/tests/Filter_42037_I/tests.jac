import from main { square_list }

test "case 0" {
    want = [1, 4, 9, 16, 25];
    got = square_list([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 4, 9];
    got = square_list([-1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 0, 1];
    got = square_list([-1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = square_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1, 4];
    got = square_list([0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
