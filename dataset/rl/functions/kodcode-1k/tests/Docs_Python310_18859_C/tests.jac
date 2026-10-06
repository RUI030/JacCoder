import from main { process_bytearrays }

test "case 0" {
    want = 'abcdefgh';
    got = process_bytearrays([('abc', 3), ('defg', 4), ('hij', 3)], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abcdefghij\x00\x00';
    got = process_bytearrays([('abc', 3), ('defg', 4), ('hij', 3)], 12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abcdefg';
    got = process_bytearrays([('abc', 3), ('defg', 4)], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abc\x00\x00';
    got = process_bytearrays([('abc', 3)], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '\x00\x00\x00\x00\x00';
    got = process_bytearrays([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = process_bytearrays([('abc', 3), ('defg', 4)], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
