import from main { is_perfect_shuffle }

test "case 0" {
    want = True;
    got = is_perfect_shuffle('abc', 'def', 'adbcef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_perfect_shuffle('abc', 'def', 'abdecf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_perfect_shuffle('abc', 'def', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_perfect_shuffle('abc', 'def', 'defabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_perfect_shuffle('abc', 'def', 'abcfde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_perfect_shuffle('aab', 'aac', 'aacaab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_perfect_shuffle('aab', 'aac', 'aaabac');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_perfect_shuffle('abc', 'aab', 'aababc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_perfect_shuffle('', '', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_perfect_shuffle('abc', '', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_perfect_shuffle('', 'def', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_perfect_shuffle('abc', 'def', 'abcfed');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = False;
    got = is_perfect_shuffle('abc', 'de', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_perfect_shuffle('abc', 'def', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}
