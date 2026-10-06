import from main { nth_prime }

test "case 0" {
    want = 2;
    got = nth_prime(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 29;
    got = nth_prime(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 541;
    got = nth_prime(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3571;
    got = nth_prime(500);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7919;
    got = nth_prime(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = nth_prime(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 7919;
    got = nth_prime(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
