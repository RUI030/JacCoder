import from main { is_match }

test "case 0" {
    want = True;
    got = is_match('abcdef', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_match('abcdef', 'a?cdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_match('abcdef', 'a*c*e*f');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_match('abcdef', 'a*f');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_match('abcdef', 'a*c?e?');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_match('abcdef', 'a*b?c*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_match('abcdef', 'a*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_match('abc', 'a*bc*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_match('defgh', '*fg*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_match('abcdef', 'abc?def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = False;
    got = is_match('abcdef', 'a*d?e');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_match('abc', 'a*c?d');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_match('', '*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = is_match('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = is_match('a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = is_match('', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = True;
    got = is_match('a', '?');
    assert got == want, f"expected={want!r} actual={got!r}";
}
