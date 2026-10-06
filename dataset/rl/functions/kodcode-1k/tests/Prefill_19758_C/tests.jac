import from main { char_frequency }

test "case 0" {
    want = {};
    got = char_frequency('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'a': 1};
    got = char_frequency('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'a': 3};
    got = char_frequency('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'a': 2, 'b': 1, 'c': 1};
    got = char_frequency('abac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 2, ' ': 2, 'b': 1};
    got = char_frequency('a a b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'!': 3, '@': 1};
    got = char_frequency('!@!!');
    assert got == want, f"expected={want!r} actual={got!r}";
}
