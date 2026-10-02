import from main { roman_to_int }

test "four" {
    want = 4;
    got = roman_to_int("IV");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "nineteen ninety four" {
    want = 1994;
    got = roman_to_int("MCMXCIV");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "max" {
    want = 3999;
    got = roman_to_int("MMMCMXCIX");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "one" {
    want = 1;
    got = roman_to_int("I");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "forty four" {
    want = 44;
    got = roman_to_int("XLIV");
    assert got == want, f"expected={want!r} actual={got!r}";
}
