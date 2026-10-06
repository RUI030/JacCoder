import from main { decode_version }

test "case 0" {
    want = '3.4.1a2';
    got = decode_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.10.0';
    got = decode_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '4.2.85b3';
    got = decode_version(67261875);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '5.1.32rc1';
    got = decode_version(83960001);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '2.2.3';
    got = decode_version(33686512);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '0.0.0';
    got = decode_version(240);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '255.255.255';
    got = decode_version(4294967295);
    assert got == want, f"expected={want!r} actual={got!r}";
}
