import from main { reverse_letters }

test "case 0" {
    want = 'e1d2cba3';
    got = reverse_letters('a1b2cde3');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'fedcba';
    got = reverse_letters('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '123456';
    got = reverse_letters('123456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'D1c2B3a4';
    got = reverse_letters('a1B2c3D4');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverse_letters('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'ZYXcba';
    got = reverse_letters('abcXYZ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '123456';
    got = reverse_letters('123456');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a';
    got = reverse_letters('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '1';
    got = reverse_letters('1');
    assert got == want, f"expected={want!r} actual={got!r}";
}
