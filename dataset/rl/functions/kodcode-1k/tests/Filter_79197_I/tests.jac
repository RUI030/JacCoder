import from main { is_even_and_prime }

test "case 0" {
    want = True;
    got = is_even_and_prime(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_even_and_prime(3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_even_and_prime(4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_even_and_prime(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_even_and_prime(101);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_even_and_prime(1000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
