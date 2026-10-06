import from main { decode_python_version }

test "case 0" {
    want = '3.4.1a2';
    got = decode_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.10.0f0';
    got = decode_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '4.0.3a3';
    got = decode_python_version(67109795);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '4.1.1b1';
    got = decode_python_version(67174833);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '3.8.8c4';
    got = decode_python_version(50858180);
    assert got == want, f"expected={want!r} actual={got!r}";
}
