import from main { compress_string }

test "case 0" {
    want = 'a2b1c5a3';
    got = compress_string('aabcccccaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a3b2c1d3';
    got = compress_string('aaabbcddd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abc';
    got = compress_string('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abcd';
    got = compress_string('abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'a';
    got = compress_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'aabbcc';
    got = compress_string('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'aabbaabb';
    got = compress_string('aabbaabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = compress_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'a4';
    got = compress_string('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'z5';
    got = compress_string('zzzzz');
    assert got == want, f"expected={want!r} actual={got!r}";
}
