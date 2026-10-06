import from main { is_anagram_extended }

test "case 0" {
    want = True;
    got = is_anagram_extended('Listen', 'Silent');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_anagram_extended('Hello, World!', 'dlroW ,!olleH');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_anagram_extended('Test', 'Best');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_anagram_extended('Dormitory', 'Dirty room');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = is_anagram_extended('Anagram', 'Nag a ram');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_anagram_extended('School master', 'The classroom!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = is_anagram_extended('A gentleman', 'Elegant man!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_anagram_extended('The Morse Code', 'Here come dots!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = is_anagram_extended('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = is_anagram_extended('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = is_anagram_extended('a', 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = is_anagram_extended('@', '@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = is_anagram_extended('123', '321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = is_anagram_extended('123', '322');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = True;
    got = is_anagram_extended('abc123!@', '321cba@!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = is_anagram_extended('abc123!@', '321cba@');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = False;
    got = is_anagram_extended('anagram', 'anagrams');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 17" {
    want = False;
    got = is_anagram_extended('short', 'longer');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 18" {
    want = True;
    got = is_anagram_extended('!@#$%^', '^%$#@!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 19" {
    want = True;
    got = is_anagram_extended('abcd!@#$', 'dcba#$@!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 20" {
    want = False;
    got = is_anagram_extended('abcd!@#$', 'dcba#$@');
    assert got == want, f"expected={want!r} actual={got!r}";
}
