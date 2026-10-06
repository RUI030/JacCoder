import from main { string_interleave }

test "case 0" {
    want = 'a1b2c3';
    got = string_interleave('abc', '123');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a1b2cd';
    got = string_interleave('abcd', '12');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a1b234';
    got = string_interleave('ab', '1234');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'xyz';
    got = string_interleave('', 'xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'hello';
    got = string_interleave('hello', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = string_interleave('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a1b2#*';
    got = string_interleave('ab#', '12*');
    assert got == want, f"expected={want!r} actual={got!r}";
}
