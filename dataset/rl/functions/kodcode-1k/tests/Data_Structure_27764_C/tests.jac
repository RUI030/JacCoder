import from main { decode_ways }

test "case 0" {
    want = 3;
    got = decode_ways('226');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = decode_ways('10');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = decode_ways('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = decode_ways('9');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = decode_ways('012');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = decode_ways('101');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = decode_ways('100');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 89;
    got = decode_ways('1111111111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = decode_ways('30');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = decode_ways('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = decode_ways('2101');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = decode_ways('110');
    assert got == want, f"expected={want!r} actual={got!r}";
}
