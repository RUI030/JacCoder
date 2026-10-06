import from main { fibonacci_up_to_n }

test "case 0" {
    want = [0, 1, 1, 2, 3, 5, 8];
    got = fibonacci_up_to_n(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = fibonacci_up_to_n(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1, 1];
    got = fibonacci_up_to_n(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = fibonacci_up_to_n(-5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1, 1, 2, 3, 5, 8, 13];
    got = fibonacci_up_to_n(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
    got = fibonacci_up_to_n(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
