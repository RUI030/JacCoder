import from main { longest_consecutive_bits }

test "case 0" {
    want = 4;
    got = longest_consecutive_bits('11011101111', '1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = longest_consecutive_bits('001100', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_consecutive_bits('101010101010', '1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = longest_consecutive_bits('1111100000', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_consecutive_bits('101010101010', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 8;
    got = longest_consecutive_bits('00000000', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_consecutive_bits('00000000', '1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = longest_consecutive_bits('111111', '1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = longest_consecutive_bits('111111', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = longest_consecutive_bits('1', '1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = longest_consecutive_bits('0', '0');
    assert got == want, f"expected={want!r} actual={got!r}";
}
