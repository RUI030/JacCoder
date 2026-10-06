import from main { is_prime }

test "case 0" {
    want = 'Not prime';
    got = is_prime(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Prime';
    got = is_prime(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Not prime';
    got = is_prime(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Not prime';
    got = is_prime(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Prime';
    got = is_prime(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Prime';
    got = is_prime(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Prime';
    got = is_prime(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Prime';
    got = is_prime(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Not prime';
    got = is_prime(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'Not prime';
    got = is_prime(15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'Not prime';
    got = is_prime(21);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'Prime';
    got = is_prime(97);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 'Prime';
    got = is_prime(101);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 'Not prime';
    got = is_prime(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 'Not prime';
    got = is_prime(102);
    assert got == want, f"expected={want!r} actual={got!r}";
}
