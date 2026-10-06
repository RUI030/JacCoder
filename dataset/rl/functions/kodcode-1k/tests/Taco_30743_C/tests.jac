import from main { determine_winner }

test "case 0" {
    want = 'Alice';
    got = determine_winner(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Alice';
    got = determine_winner(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Alice';
    got = determine_winner(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Alice';
    got = determine_winner(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Bob';
    got = determine_winner(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Bob';
    got = determine_winner(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Bob';
    got = determine_winner(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Bob';
    got = determine_winner(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Bob';
    got = determine_winner(100000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'Alice';
    got = determine_winner(100000001);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'Alice';
    got = determine_winner(999999999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'Bob';
    got = determine_winner(1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
