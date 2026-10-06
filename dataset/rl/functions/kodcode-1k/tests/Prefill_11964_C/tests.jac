import from main { generate_primes }

test "case 0" {
    want = [];
    got = generate_primes(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = generate_primes(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = generate_primes(-10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2];
    got = generate_primes(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3];
    got = generate_primes(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 5];
    got = generate_primes(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 3, 5, 7];
    got = generate_primes(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2, 3, 5, 7, 11];
    got = generate_primes(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [2, 3, 5, 7, 11, 13, 17, 19];
    got = generate_primes(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
    got = generate_primes(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47];
    got = generate_primes(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [2, 3];
    got = generate_primes(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = [2, 3, 5, 7];
    got = generate_primes(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = [2, 3, 5, 7, 11, 13];
    got = generate_primes(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}
