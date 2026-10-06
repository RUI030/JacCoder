import from main { longest_common_subsequence }

test "case 0" {
    want = 4;
    got = longest_common_subsequence('AGGTAB', 'GXTXAYB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = longest_common_subsequence('ABC', 'DEF');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_common_subsequence('', 'DEF');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_common_subsequence('ABC', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = longest_common_subsequence('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = longest_common_subsequence('SAME', 'SAME');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = longest_common_subsequence('ABCDEFG', 'EFG');
    assert got == want, f"expected={want!r} actual={got!r}";
}
