import from main { sum_fibonacci }

test "case 0" {
    want = 0;
    got = sum_fibonacci(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_fibonacci(-5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = sum_fibonacci(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = sum_fibonacci(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 20;
    got = sum_fibonacci(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 376;
    got = sum_fibonacci(144);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 33;
    got = sum_fibonacci(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}
