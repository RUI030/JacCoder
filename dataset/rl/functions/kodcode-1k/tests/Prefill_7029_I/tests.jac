import from main { factorial }

test "case 0" {
    want = 1;
    got = factorial(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = factorial(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = factorial(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = factorial(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 24;
    got = factorial(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 120;
    got = factorial(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3628800;
    got = factorial(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 720;
    got = factorial(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5040;
    got = factorial(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}
