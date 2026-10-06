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
    want = 1;
    got = fibonacci(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = fibonacci(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = fibonacci(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = fibonacci(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 55;
    got = fibonacci(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 610;
    got = fibonacci(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 6765;
    got = fibonacci(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 832040;
    got = fibonacci(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 12586269025;
    got = fibonacci(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}
