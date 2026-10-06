import from main { longest_substring_with_k_deletions }

test "case 0" {
    want = 5;
    got = longest_substring_with_k_deletions('abcde', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_substring_with_k_deletions('abcde', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = longest_substring_with_k_deletions('abacaba', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_substring_with_k_deletions('aaaaa', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = longest_substring_with_k_deletions('abcde', 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = longest_substring_with_k_deletions('aabbaacc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_substring_with_k_deletions('abcdefg', 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}
