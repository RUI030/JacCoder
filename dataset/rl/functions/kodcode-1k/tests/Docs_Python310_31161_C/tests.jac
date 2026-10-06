import from main { parse_python_version }

test "case 0" {
    want = '3.4.1a2';
    got = parse_python_version(50594210);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '3.10.0';
    got = parse_python_version(50987248);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '2.7.3b4';
    got = parse_python_version(34014132);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '4.2.2c1';
    got = parse_python_version(67240641);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '1.0.0';
    got = parse_python_version(16777456);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '2.3.0';
    got = parse_python_version(33751280);
    assert got == want, f"expected={want!r} actual={got!r}";
}
