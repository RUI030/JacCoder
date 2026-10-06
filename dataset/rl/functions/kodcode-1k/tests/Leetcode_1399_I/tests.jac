import from main { largest_odd_substring }

test "case 0" {
    want = '1234567';
    got = largest_odd_substring('1234567');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = largest_odd_substring('24680');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '1234567';
    got = largest_odd_substring('12345678');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '3';
    got = largest_odd_substring('3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = largest_odd_substring('4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = largest_odd_substring('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '123405';
    got = largest_odd_substring('123405');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '000123';
    got = largest_odd_substring('0001234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '123456789123456789';
    got = largest_odd_substring('123456789123456789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '2468246824682463';
    got = largest_odd_substring('2468246824682463');
    assert got == want, f"expected={want!r} actual={got!r}";
}
