import from main { odd_prime_digits_info }

test "case 0" {
    want = (False, False, 0);
    got = odd_prime_digits_info(2468);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (True, False, 0);
    got = odd_prime_digits_info(1119);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (True, True, 3);
    got = odd_prime_digits_info(357);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (True, False, 3);
    got = odd_prime_digits_info(13527);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (True, True, 1);
    got = odd_prime_digits_info(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (True, False, 0);
    got = odd_prime_digits_info(9);
    assert got == want, f"expected={want!r} actual={got!r}";
}
