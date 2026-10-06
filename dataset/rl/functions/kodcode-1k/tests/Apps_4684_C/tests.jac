import from main { roman_to_int }

test "case 0" {
    want = 3;
    got = roman_to_int('III');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = roman_to_int('IV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = roman_to_int('IX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 58;
    got = roman_to_int('LVIII');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1994;
    got = roman_to_int('MCMXCIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 20;
    got = roman_to_int('XX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 259;
    got = roman_to_int('CCLIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3999;
    got = roman_to_int('MMMCMXCIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 890;
    got = roman_to_int('DCCCXC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 900;
    got = roman_to_int('CM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = roman_to_int('I');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 3000;
    got = roman_to_int('MMM');
    assert got == want, f"expected={want!r} actual={got!r}";
}
