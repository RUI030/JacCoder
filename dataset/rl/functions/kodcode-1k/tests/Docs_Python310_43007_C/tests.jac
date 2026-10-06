import from main { decode_python_version }

test "case 0" {
    want = '3.4.1a2';
    got = decode_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.10.0';
    got = decode_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '3.5.0b1';
    got = decode_python_version(50659505);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '3.6.1rc0';
    got = decode_python_version(50725312);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '3.7.2';
    got = decode_python_version(50791155);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '3.7.3a4';
    got = decode_python_version(50791332);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '3.8.3rc5';
    got = decode_python_version(50856901);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '3.9.0';
    got = decode_python_version(50921718);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '0.0.0';
    got = decode_python_version(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '0.0.0';
    got = decode_python_version(0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '15.15.15';
    got = decode_python_version(252645367);
    assert got == want, f"expected={want!r} actual={got!r}";
}
