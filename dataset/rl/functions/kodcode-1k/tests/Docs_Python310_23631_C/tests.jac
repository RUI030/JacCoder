import from main { reverse_squares_of_odds }

test "case 0" {
    want = [25, 9, 1];
    got = reverse_squares_of_odds([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = reverse_squares_of_odds([10, 20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [49];
    got = reverse_squares_of_odds([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = reverse_squares_of_odds([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [25, 9, 1];
    got = reverse_squares_of_odds([-1, -3, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [25, 9, 1];
    got = reverse_squares_of_odds([0, 1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 9, 25, 49, 81];
    got = reverse_squares_of_odds([9, 7, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [9, 25, 1, 9];
    got = reverse_squares_of_odds([-3, -2, 1, 4, -5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
