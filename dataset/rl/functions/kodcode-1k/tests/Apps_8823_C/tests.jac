import from main { getPrimes }

test "case 0" {
    want = [];
    got = getPrimes(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = getPrimes(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = getPrimes(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 3, 5, 7];
    got = getPrimes(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3, 5, 7, 11, 13, 17, 19];
    got = getPrimes(20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29];
    got = getPrimes(30);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47];
    got = getPrimes(50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2];
    got = getPrimes(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
