import from main { group_anagrams }

test "empty" {
    want = [];
    got = group_anagrams([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "single word" {
    want = [["solo"]];
    got = group_anagrams(["solo"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "no anagrams" {
    want = [["a"], ["b"], ["c"]];
    got = group_anagrams(["c", "a", "b"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "duplicates kept" {
    want = [["ab", "ab", "ba"]];
    got = group_anagrams(["ab", "ba", "ab"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case sensitive" {
    want = [["Ab", "bA"], ["ab"]];
    got = group_anagrams(["Ab", "bA", "ab"]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
