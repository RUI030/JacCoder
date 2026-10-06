import from main { decodeString }

test "case 0" {
    want = 1;
    got = decodeString('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = decodeString('9');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = decodeString('10');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = decodeString('26');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = decodeString('20');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = decodeString('226');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = decodeString('11106');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = decodeString('1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = decodeString('0');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = decodeString('10');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = decodeString('1010');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 0;
    got = decodeString('1001');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = decodeString('303');
    assert got == want, f"expected={want!r} actual={got!r}";
}
