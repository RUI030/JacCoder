import from main { fibonacci }

test "case 0" {
    want = 0;
    got = fibonacci(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = fibonacci(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = fibonacci(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 55;
    got = fibonacci(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6765;
    got = fibonacci(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 832040;
    got = fibonacci(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}
