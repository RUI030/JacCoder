import from main { is_valid_hexadecimal }

test "case 0" {
    want = True;
    got = is_valid_hexadecimal('0x1A3F');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_valid_hexadecimal('0Xabc123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_valid_hexadecimal('0xABCDEF');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_valid_hexadecimal('0X123456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_valid_hexadecimal('1A3F');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_valid_hexadecimal('abc123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_valid_hexadecimal('ABCDEF');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_valid_hexadecimal('123456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_valid_hexadecimal('1A3G');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_valid_hexadecimal('0xGHJK');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_valid_hexadecimal('0x123z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_valid_hexadecimal('0X@@@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = is_valid_hexadecimal('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_valid_hexadecimal('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_valid_hexadecimal('0x');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = is_valid_hexadecimal('0X');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = True;
    got = is_valid_hexadecimal('0x0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = True;
    got = is_valid_hexadecimal('0Xf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = False;
    got = is_valid_hexadecimal('X12345');
    assert got == want, f"expected={want!r} actual={got!r}";
}
