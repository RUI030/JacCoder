import from main { are_anagrams }

test "case 0" {
    want = 'YES';
    got = are_anagrams('listen', 'silent');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = are_anagrams('hello', 'billion');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = are_anagrams('aabbcc', 'ccbbaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = are_anagrams('abcdef', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = are_anagrams('anagram', 'anagram');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = are_anagrams('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}
