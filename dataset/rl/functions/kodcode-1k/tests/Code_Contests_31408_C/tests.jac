import from main { get_winner }

test "case 0" {
    want = (25, 25, 'Draw');
    got = get_winner(10, 20, 15, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (40, 25, 'Alex');
    got = get_winner(30, 20, 10, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (25, 45, 'Bob');
    got = get_winner(20, 30, 5, 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (0, 0, 'Draw');
    got = get_winner(0, 0, 0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (125, 125, 'Draw');
    got = get_winner(100, 50, 25, 75);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (150, 75, 'Alex');
    got = get_winner(100, 50, 50, 25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (75, 175, 'Bob');
    got = get_winner(50, 100, 25, 75);
    assert got == want, f"expected={want!r} actual={got!r}";
}
