import from main { num_decodings }

test "case 0" {
    want = 1;
    got = num_decodings('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = num_decodings('9');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = num_decodings('10');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = num_decodings('20');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = num_decodings('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = num_decodings('06');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = num_decodings('12');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = num_decodings('226');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = num_decodings('123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 89;
    got = num_decodings('1111111111');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = num_decodings('101');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 1;
    got = num_decodings('110');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = num_decodings('1001');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 0;
    got = num_decodings('10010');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 0;
    got = num_decodings('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 1;
    got = num_decodings('27');
    assert got == want, f"expected={want!r} actual={got!r}";
}
