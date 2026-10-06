import from main { is_prime }

test "case 0" {
    want = True;
    got = is_prime(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_prime(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_prime(5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_prime(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_prime(11);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_prime(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_prime(6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_prime(8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_prime(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_prime(10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_prime(-1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_prime(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = is_prime(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = is_prime(7919);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_prime(7918);
    assert got == want, f"expected={want!r} actual={got!r}";
}
