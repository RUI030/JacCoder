import from main { int_to_roman }

test "one" {
    want = "I";
    got = int_to_roman(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "four and nine" {
    want = "XLIX";
    got = int_to_roman(49);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "year" {
    want = "MCMXCIV";
    got = int_to_roman(1994);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "max" {
    want = "MMMCMXCIX";
    got = int_to_roman(3999);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "four hundred" {
    want = "CD";
    got = int_to_roman(400);
    assert got == want, f"expected={want!r} actual={got!r}";
}
