import from main { find_anagram_pairs }

test "case 0" {
    want = [];
    got = find_anagram_pairs(['apple', 'banana', 'cherry']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(0, 1), (0, 2), (1, 2)];
    got = find_anagram_pairs(['listen', 'silent', 'enlist']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(0, 1), (0, 2), (1, 2), (3, 4)];
    got = find_anagram_pairs(['listen', 'silent', 'enlist', 'google', 'gooegl']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(0, 1), (0, 2), (1, 2)];
    got = find_anagram_pairs(['Listen', 'Silent', 'Enlist']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = find_anagram_pairs(['apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [(0, 1), (0, 2), (1, 2)];
    got = find_anagram_pairs(['apple', 'apple', 'Apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
