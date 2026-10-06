import from main { calculate_factorial }

test "case 0" {
    want = 120;
    got = calculate_factorial(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = calculate_factorial(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = calculate_factorial(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = calculate_factorial(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = calculate_factorial(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = None;
    got = calculate_factorial(-5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3628800;
    got = calculate_factorial(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
