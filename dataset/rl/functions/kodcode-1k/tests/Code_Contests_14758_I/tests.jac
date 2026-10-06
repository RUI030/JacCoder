import from main { determine_winner }

test "case 0" {
    want = 'Alice';
    got = determine_winner(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Bob';
    got = determine_winner(4, [4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Alice';
    got = determine_winner(5, [1, 1, 2, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Bob';
    got = determine_winner(2, [1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Alice';
    got = determine_winner(6, [1, 2, 2, 1, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Bob';
    got = determine_winner(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Alice';
    got = determine_winner(2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Bob';
    got = determine_winner(3, [3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Alice';
    got = determine_winner(3, [3, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
