import from main { compress_string }

test "case 0" {
    want = 'a3b2c';
    got = compress_string('aaabbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abcd';
    got = compress_string('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a4';
    got = compress_string('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = compress_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'xyz';
    got = compress_string('xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a2b2c2';
    got = compress_string('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a2b2a2';
    got = compress_string('aabbaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a3b3c3';
    got = compress_string('aaabbbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'a';
    got = compress_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'a2b2c2a';
    got = compress_string('aabbcca');
    assert got == want, f"expected={want!r} actual={got!r}";
}
