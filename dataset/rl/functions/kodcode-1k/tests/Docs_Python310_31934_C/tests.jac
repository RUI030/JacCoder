import from main { decode_python_version }

test "case 0" {
    want = '3.4.1a2';
    got = decode_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.5.2b3';
    got = decode_python_version(50660019);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '3.6.3rc1';
    got = decode_python_version(50725825);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '3.10.0';
    got = decode_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '2.7.3';
    got = decode_python_version(34014192);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '1.0.0';
    got = decode_python_version(16777456);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '255.255.0a15';
    got = decode_python_version(4294901935);
    assert got == want, f"expected={want!r} actual={got!r}";
}
