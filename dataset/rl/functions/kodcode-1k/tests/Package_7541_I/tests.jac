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
    got = are_anagrams('Apple', 'Pineapple');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = are_anagrams('Dormitory', 'Dirty room');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = are_anagrams('Conversation', 'Voices rant on');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = are_anagrams('Hello', 'Helloo');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = are_anagrams('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = are_anagrams('A gentleman', 'Elegant man');
    assert got == want, f"expected={want!r} actual={got!r}";
}
