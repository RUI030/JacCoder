import from main { decode_python_version }

test "case 0" {
    want = '3.10.0';
    got = decode_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.4.1';
    got = decode_python_version(50594288);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '3.4.1a2';
    got = decode_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '3.10.0a1';
    got = decode_python_version(50987169);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '3.4.1b3';
    got = decode_python_version(50594227);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '3.10.0b2';
    got = decode_python_version(50987186);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '3.4.1rc4';
    got = decode_python_version(50594244);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '3.10.0rc1';
    got = decode_python_version(50987201);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '2.7.1';
    got = decode_python_version(34013680);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = '3.8.5rc1';
    got = decode_python_version(50857409);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = '3.17.0b3';
    got = decode_python_version(51445939);
    assert got == want, f"expected={want!r} actual={got!r}";
}
