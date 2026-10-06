import from main { roman_to_int }

test "case 0" {
    want = 621;
    got = roman_to_int('DCXXI');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = roman_to_int('IX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1994;
    got = roman_to_int('MCMXCIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2021;
    got = roman_to_int('MMXXI');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = roman_to_int('III');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = roman_to_int('IV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 40;
    got = roman_to_int('XL');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 444;
    got = roman_to_int('CDXLIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3999;
    got = roman_to_int('MMMCMXCIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 90;
    got = roman_to_int('XC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 74;
    got = roman_to_int('LXXIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}
