import from main { primes_less_than }

test "case 0" {
    want = [2, 3, 5, 7];
    got = primes_less_than(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3, 5, 7, 11, 13, 17, 19];
    got = primes_less_than(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = primes_less_than(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = primes_less_than(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = primes_less_than(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 5, 7, 11, 13];
    got = primes_less_than(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}
