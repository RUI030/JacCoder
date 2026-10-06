import from main { are_anagrams }

test "case 0" {
    want = True;
    got = are_anagrams('Astronomer', 'Moon starer');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = are_anagrams('Hello, World!', 'dlroW ,olleH');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = are_anagrams('Programming', 'Gram Ring Mop');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = are_anagrams('One', 'Two');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = are_anagrams('123 ABC!', '!cba 321');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = are_anagrams('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = are_anagrams('Hello', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = are_anagrams('aabbcc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = True;
    got = are_anagrams('racecar', 'carrace');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = True;
    got = are_anagrams('Dormitory123', 'Dirty room 321');
    assert got == want, f"expected={want!r} actual={got!r}";
}
