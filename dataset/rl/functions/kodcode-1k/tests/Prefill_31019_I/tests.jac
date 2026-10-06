import from main { count_characters }

test "case 0" {
    want = {'a': 1, 'b': 1, 'c': 1};
    got = count_characters('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'a': 2, 'b': 2, 'c': 2};
    got = count_characters('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'a': 2, 'b': 2, 'c': 2};
    got = count_characters('aAbBcC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'a': 2, ' ': 2, 'b': 1};
    got = count_characters('a a b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {};
    got = count_characters('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'a': 2, 'b': 2, 'c': 2};
    got = count_characters('AaBbCc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = {'a': 2, '!': 1, '@': 1, 'b': 1, '#': 1};
    got = count_characters('a!a@b#');
    assert got == want, f"expected={want!r} actual={got!r}";
}
