import from main { find_trigrams }

test "case 0" {
    want = {'hel', 'ell', 'llo'};
    got = find_trigrams('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = set();
    got = find_trigrams('hi');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'abc', 'bcd', 'cde', 'def'};
    got = find_trigrams('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {'aaa', 'aab', 'abb', 'bbb'};
    got = find_trigrams('aaabbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'aAa', 'AaA'};
    got = find_trigrams('aAaA');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'a!@', '!@#'};
    got = find_trigrams('a!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}
