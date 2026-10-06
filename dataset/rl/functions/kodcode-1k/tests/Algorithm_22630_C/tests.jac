import from main { is_repeated_substring_pattern }

test "case 0" {
    want = True;
    got = is_repeated_substring_pattern('abab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_repeated_substring_pattern('aba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_repeated_substring_pattern('abcabcabcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_repeated_substring_pattern('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_repeated_substring_pattern('xyzxyzxyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_repeated_substring_pattern('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_repeated_substring_pattern('bbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_repeated_substring_pattern('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_repeated_substring_pattern('abcdabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = is_repeated_substring_pattern('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_repeated_substring_pattern('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_repeated_substring_pattern('abcabcabcabcabcabcabcabcabcabcabcabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_repeated_substring_pattern('ABAB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = True;
    got = is_repeated_substring_pattern('abcdABCDabcdABCD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = True;
    got = is_repeated_substring_pattern('aAbBaAbB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = True;
    got = is_repeated_substring_pattern('aAbBaAbBaAbB');
    assert got == want, f"expected={want!r} actual={got!r}";
}
