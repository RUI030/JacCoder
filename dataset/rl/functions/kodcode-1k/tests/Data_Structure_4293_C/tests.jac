import from main { is_merge }

test "case 0" {
    want = True;
    got = is_merge('codewars', 'cdw', 'oears');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_merge('abc', 'a', 'bc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_merge('abc', 'ab', 'c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_merge('abc', 'b', 'ca');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_merge('abc', 'ab', 'cd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_merge('', '', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_merge('a', '', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_merge('a', 'a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_merge('a', 'a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_merge('abcdef', 'ace', 'bdf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_merge('abcdef', 'abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_merge('aabbccddeeff', 'abcdef', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_merge('abcdefghijkl', 'acegik', 'bdfhjl');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_merge('abcdefghijkl', 'aceg', 'bdfhjl');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_merge('abcdefghijkl', 'acegik', 'bdf');
    assert got == want, f"expected={want!r} actual={got!r}";
}
