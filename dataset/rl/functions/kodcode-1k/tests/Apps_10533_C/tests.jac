import from main { char_frequency }

test "case 0" {
    want = {'h': 1, 'e': 1, 'l': 3, 'o': 2, 'w': 1, 'r': 1, 'd': 1};
    got = char_frequency('HelloWorld');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'p': 1, 'r': 2, 'o': 1, 'g': 2, 'a': 1, 'm': 2, 'i': 1, 'n': 1};
    got = char_frequency('Programming');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'d': 1, 'a': 2, 't': 1, 's': 1, 'c': 2, 'i': 1, 'e': 2, 'n': 1};
    got = char_frequency('DataScience');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {};
    got = char_frequency('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 2, 'b': 2, 'c': 2, 'd': 2, 'e': 2};
    got = char_frequency('AaBbCcDdEe');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'a': 1, 'b': 1, 'c': 1, 'd': 1, 'e': 1, 'f': 1, 'g': 1, 'h': 1, 'i': 1, 'j': 1, 'k': 1, 'l': 1};
    got = char_frequency('aBCdeFghiJkL');
    assert got == want, f"expected={want!r} actual={got!r}";
}
