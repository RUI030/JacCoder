import from main { remove_repeats }

test "case 0" {
    want = 'abcdef';
    got = remove_repeats('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abc';
    got = remove_repeats('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abc';
    got = remove_repeats('abacbc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = remove_repeats('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'ab';
    got = remove_repeats('aaaabbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abcd';
    got = remove_repeats('abacabad');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = remove_repeats('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a';
    got = remove_repeats('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'b';
    got = remove_repeats('bbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}
