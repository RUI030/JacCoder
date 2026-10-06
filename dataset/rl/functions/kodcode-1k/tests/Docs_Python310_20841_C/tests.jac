import from main { parse_py_version }

test "case 0" {
    want = '3.4.1a2';
    got = parse_py_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.7.2b3';
    got = parse_py_version(50791091);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '3.9.2rc1';
    got = parse_py_version(50922177);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '3.10.0';
    got = parse_py_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '3.8.0';
    got = parse_py_version(50856178);
    assert got == want, f"expected={want!r} actual={got!r}";
}
