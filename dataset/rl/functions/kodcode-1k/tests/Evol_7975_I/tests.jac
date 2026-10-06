import from main { is_anagram }

test "case 0" {
    want = True;
    got = is_anagram('Listen', 'Silent');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_anagram('A gentleman', 'Elegant man');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_anagram('Dormitory', 'Dirty room');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_anagram('Hello', 'World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_anagram('Aabbcc', 'aabbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_anagram('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_anagram('a', 'aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
