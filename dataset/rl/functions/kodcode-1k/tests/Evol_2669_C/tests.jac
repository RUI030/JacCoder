import from main { character_count }

test "case 0" {
    want = {'a': 1};
    got = character_count('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'a': 2, 'b': 2};
    got = character_count('AaBb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'p': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1};
    got = character_count('Programming');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {};
    got = character_count('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 1, '1': 1, 'b': 1, '2': 1, 'c': 1, '3': 1, '!': 1, '@': 1, '#': 1};
    got = character_count('a1b2c3!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}
