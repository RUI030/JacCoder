import from main { is_valid_pattern }

test "case 0" {
    want = True;
    got = is_valid_pattern('abba', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_valid_pattern('abba', 'dog cat cat fish');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_valid_pattern('aaaa', 'dog dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_valid_pattern('abba', 'dog dog dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_valid_pattern('a', 'dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_valid_pattern('a', 'dog dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_valid_pattern('abc', 'dog cat bird cat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_valid_pattern('abcd', 'dog cat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_valid_pattern('abc', 'dog cat bird');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_valid_pattern('aaaa', 'dog cat cat dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}
