import from main { generalized_anagram }

test "case 0" {
    want = True;
    got = generalized_anagram('apple', 'pleap');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = generalized_anagram('apple', 'cherry');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = generalized_anagram('123', '231');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = generalized_anagram('Apple', 'apple');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = generalized_anagram('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = generalized_anagram('a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = False;
    got = generalized_anagram('ab', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = generalized_anagram('a@b#c', 'c#b@a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = generalized_anagram('a@b#c', 'a@b#d');
    assert got == want, f"expected={want!r} actual={got!r}";
}
