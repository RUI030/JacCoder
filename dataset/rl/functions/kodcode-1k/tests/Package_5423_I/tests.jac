import from main { factorial_recursive }

test "case 0" {
    want = 1;
    got = factorial_recursive(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = factorial_recursive(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 120;
    got = factorial_recursive(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5040;
    got = factorial_recursive(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3628800;
    got = factorial_recursive(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
