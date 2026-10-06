import from main { encode_rle }

test "case 0" {
    want = 'A4B3C2D1A2';
    got = encode_rle('AAAABBBCCDAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'A1B1C1D1';
    got = encode_rle('ABCD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'A2B1';
    got = encode_rle('AAB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'A1';
    got = encode_rle('A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'B1';
    got = encode_rle('B');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'A1B1C1D1E1F1G1';
    got = encode_rle('ABCDEFG');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'A5';
    got = encode_rle('AAAAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = encode_rle('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'A3B3C3A2';
    got = encode_rle('AAABBBCCCAA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'A2B2A6C4';
    got = encode_rle('AABBAAAAAACCCC');
    assert got == want, f"expected={want!r} actual={got!r}";
}
