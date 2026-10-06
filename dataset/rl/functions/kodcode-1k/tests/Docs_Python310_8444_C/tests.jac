import from main { decode_python_version }

test "case 0" {
    want = '3.4.1a2';
    got = decode_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.5.1b3';
    got = decode_python_version(50659763);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '3.6.2c4';
    got = decode_python_version(50725572);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '3.7.3';
    got = decode_python_version(50791408);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '3.10.0';
    got = decode_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '3.1.10';
    got = decode_python_version(50399984);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '10.1.1';
    got = decode_python_version(167838192);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '3.10.0b4';
    got = decode_python_version(50987188);
    assert got == want, f"expected={want!r} actual={got!r}";
}
