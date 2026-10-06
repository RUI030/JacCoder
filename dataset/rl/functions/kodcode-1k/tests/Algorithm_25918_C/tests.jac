import from main { are_anagrams }

test "case 0" {
    want = True;
    got = are_anagrams('Listen', 'Silent');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = are_anagrams('Triangle', 'Integral');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = are_anagrams('Apple', 'Pabble');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = are_anagrams('A gentleman', 'Elegant man');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = are_anagrams('Conversation', 'Voices rant on');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = are_anagrams('Clint Eastwood', 'Old West Action');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = are_anagrams('School master', 'The classroom');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = are_anagrams('Dormitory', 'Dirty Room');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = are_anagrams('Astronomer', 'Moon starer');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = are_anagrams('The eyes', 'They see');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = True;
    got = are_anagrams('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = True;
    got = are_anagrams('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = True;
    got = are_anagrams('a', 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = False;
    got = are_anagrams('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = False;
    got = are_anagrams('Hello', 'World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = False;
    got = are_anagrams('Python', 'Java');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 16" {
    want = False;
    got = are_anagrams('Anagram', 'Nonagram');
    assert got == want, f"expected={want!r} actual={got!r}";
}
