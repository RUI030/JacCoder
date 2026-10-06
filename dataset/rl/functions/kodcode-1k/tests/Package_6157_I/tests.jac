import from main { generate_fibonacci_sum }

test "case 0" {
    want = 0;
    got = generate_fibonacci_sum(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = generate_fibonacci_sum(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = generate_fibonacci_sum(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = generate_fibonacci_sum(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = generate_fibonacci_sum(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = generate_fibonacci_sum(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 88;
    got = generate_fibonacci_sum(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 986;
    got = generate_fibonacci_sum(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = generate_fibonacci_sum(-5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = generate_fibonacci_sum(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
