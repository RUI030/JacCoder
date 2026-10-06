import from main { roman_to_int }

test "case 0" {
    want = 1;
    got = roman_to_int('I');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = roman_to_int('V');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = roman_to_int('X');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 50;
    got = roman_to_int('L');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 100;
    got = roman_to_int('C');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 500;
    got = roman_to_int('D');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1000;
    got = roman_to_int('M');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = roman_to_int('III');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = roman_to_int('IV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 9;
    got = roman_to_int('IX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 58;
    got = roman_to_int('LVIII');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1994;
    got = roman_to_int('MCMXCIV');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 22;
    got = roman_to_int('XXII');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 2021;
    got = roman_to_int('MMXXI');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 369;
    got = roman_to_int('CCCLXIX');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 40;
    got = roman_to_int('XL');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = 90;
    got = roman_to_int('XC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = 400;
    got = roman_to_int('CD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = 900;
    got = roman_to_int('CM');
    assert got == want, f"expected={want!r} actual={got!r}";
}
