import from main { roman_to_integer }

test "case 0" {
    want = 3;
    got = roman_to_integer('III');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = roman_to_integer('IV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = roman_to_integer('IX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 58;
    got = roman_to_integer('LVIII');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1994;
    got = roman_to_integer('MCMXCIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = roman_to_integer('I');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3999;
    got = roman_to_integer('MMMCMXCIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3848;
    got = roman_to_integer('MMMDCCCXLVIII');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 499;
    got = roman_to_integer('CDXCIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 90;
    got = roman_to_integer('XC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 900;
    got = roman_to_integer('CM');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 44;
    got = roman_to_integer('XLIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 99;
    got = roman_to_integer('XCIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 444;
    got = roman_to_integer('CDXLIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 994;
    got = roman_to_integer('CMXCIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 67;
    got = roman_to_integer('LXVII');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 890;
    got = roman_to_integer('DCCCXC');
    assert got == want, f"expected={want!r} actual={got!r}";
}
