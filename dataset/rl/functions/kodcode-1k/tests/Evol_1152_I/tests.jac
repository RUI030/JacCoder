import from main { are_anagrams }

test "case 0" {
    want = True;
    got = are_anagrams('listen', 'listen');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = are_anagrams('listen', 'silent');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = are_anagrams('Listen', 'Silent');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = are_anagrams('conversation', 'voices rant on');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = are_anagrams('dormitory', 'dirty room');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = are_anagrams('the eyes', 'they see');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = are_anagrams('a gentleman', 'elegant man!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = are_anagrams('abc', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = are_anagrams('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = are_anagrams('a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = are_anagrams('!@#', '#@!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = False;
    got = are_anagrams('!@#', '#@');
    assert got == want, f"expected={want!r} actual={got!r}";
}
