import from main { is_match }

test "case 0" {
    want = False;
    got = is_match('aa', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_match('aa', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_match('aaa', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_match('aa', 'a*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_match('aa', '.*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_match('ab', '.*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_match('aab', 'c*a*b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_match('mississippi', 'mis*is*p*.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_match('ab', '.*c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_match('aaa', 'a*a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_match('', '.*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_match('a', 'ab*');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_match('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = is_match('', 'a*');
    assert got == want, f"expected={want!r} actual={got!r}";
}
