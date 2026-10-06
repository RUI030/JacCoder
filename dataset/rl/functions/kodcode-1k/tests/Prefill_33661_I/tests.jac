import from main { generate_fibonacci }

test "case 0" {
    want = [0, 1, 1, 2, 3];
    got = generate_fibonacci(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = generate_fibonacci(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1];
    got = generate_fibonacci(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = generate_fibonacci(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = generate_fibonacci(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = generate_fibonacci(-10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34];
    got = generate_fibonacci(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
