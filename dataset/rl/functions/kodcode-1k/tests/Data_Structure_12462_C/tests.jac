import from main { word_pattern }

test "case 0" {
    want = True;
    got = word_pattern('abba', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = word_pattern('abba', 'dog cat cat fish');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = word_pattern('aaaa', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = word_pattern('abba', 'dog dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = word_pattern('abc', 'dog cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = word_pattern('abcabc', 'dog cat fish dog cat fish');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = word_pattern('a', 'dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = word_pattern('abcd', 'dog cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}
