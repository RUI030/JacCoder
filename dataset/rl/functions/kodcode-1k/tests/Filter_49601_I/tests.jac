import from main { sieve_of_eratosthenes }

test "case 0" {
    want = [];
    got = sieve_of_eratosthenes(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = sieve_of_eratosthenes(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2];
    got = sieve_of_eratosthenes(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 3];
    got = sieve_of_eratosthenes(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3, 5, 7];
    got = sieve_of_eratosthenes(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 5, 7, 11, 13, 17, 19];
    got = sieve_of_eratosthenes(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
    got = sieve_of_eratosthenes(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47];
    got = sieve_of_eratosthenes(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}
