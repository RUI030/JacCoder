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
    want = True;
    got = word_pattern('a', 'dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = word_pattern('a', 'dog cat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = word_pattern('ab', 'dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = word_pattern('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = word_pattern('abcdefgh', 'one two three four five six seven eight');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = word_pattern('abac', 'one two one three');
    assert got == want, f"expected={want!r} actual={got!r}";
}
