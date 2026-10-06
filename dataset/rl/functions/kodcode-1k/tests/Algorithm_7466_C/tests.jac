import from main { unicode_digit_sum }

test "case 0" {
    want = 6;
    got = unicode_digit_sum('123abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = unicode_digit_sum('a1b2c3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 15;
    got = unicode_digit_sum('अनु456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = unicode_digit_sum('١٢٣٤');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = unicode_digit_sum('内3外2');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = unicode_digit_sum('你好');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = unicode_digit_sum('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = unicode_digit_sum('１２３');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 15;
    got = unicode_digit_sum('12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}
