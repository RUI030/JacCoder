import from main { find_primes }

test "case 0" {
    want = [2];
    got = find_primes(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3];
    got = find_primes(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 3, 5];
    got = find_primes(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 3, 5, 7];
    got = find_primes(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3, 5, 7, 11, 13, 17, 19];
    got = find_primes(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47];
    got = find_primes(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97];
    got = find_primes(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = find_primes(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [];
    got = find_primes(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
