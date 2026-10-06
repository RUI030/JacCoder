import from main { fibonacci_sequence }

test "case 0" {
    want = [];
    got = fibonacci_sequence(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = fibonacci_sequence(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1];
    got = fibonacci_sequence(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 1, 2, 3];
    got = fibonacci_sequence(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34];
    got = fibonacci_sequence(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
