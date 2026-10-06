import from main { is_match }

test "case 0" {
    want = True;
    got = is_match('aa', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_match('aa', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_match('aa', 'a*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_match('aa', '.*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_match('ab', '.*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_match('aab', 'c*a*b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_match('aaa', 'aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_match('a', '.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_match('abcd', 'd*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_match('', 'a*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_match('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = is_match('', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_match('', '.*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = is_match('', '.*a*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = True;
    got = is_match('abcd', '.*d');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = is_match('abcd', '.*c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = True;
    got = is_match('abcd', 'a.*d');
    assert got == want, f"expected={want!r} actual={got!r}";
}
