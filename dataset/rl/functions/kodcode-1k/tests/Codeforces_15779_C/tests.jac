import from main { check_clear_winner }

test "case 0" {
    want = 'YES';
    got = check_clear_winner(4, [12, 7, 9, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = check_clear_winner(3, [5, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = check_clear_winner(3, [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = check_clear_winner(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = check_clear_winner(5, [3, 1, 2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = check_clear_winner(4, [10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
