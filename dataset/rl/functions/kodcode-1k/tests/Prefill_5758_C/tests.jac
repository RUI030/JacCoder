import from main { fibonacci_up_to }

test "case 0" {
    want = [0, 1, 1, 2, 3, 5, 8];
    got = fibonacci_up_to(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = fibonacci_up_to(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1, 1];
    got = fibonacci_up_to(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 1, 2];
    got = fibonacci_up_to(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = fibonacci_up_to(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
    got = fibonacci_up_to(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
