import from main { prime_factors }

test "case 0" {
    want = [13];
    got = prime_factors(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 2, 7];
    got = prime_factors(28);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = prime_factors(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 2, 5, 5];
    got = prime_factors(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3, 3];
    got = prime_factors(18);
    assert got == want, f"expected={want!r} actual={got!r}";
}
