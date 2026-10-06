import from main { longest_common_subsequence }

test "case 0" {
    want = 'GTAB';
    got = longest_common_subsequence('AGGTAB', 'GXTXAYB');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = longest_common_subsequence('ABC', 'DEF');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'ABCDEFG';
    got = longest_common_subsequence('ABCDEFG', 'ABCDEFG');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'AC';
    got = longest_common_subsequence('ABC', 'BAC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'ABD';
    got = longest_common_subsequence('ABCD', 'AEBDFD');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = longest_common_subsequence('', 'ABC');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = longest_common_subsequence('ABC', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'A';
    got = longest_common_subsequence('A', 'A');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '';
    got = longest_common_subsequence('A', 'B');
    assert got == want, f"expected={want!r} actual={got!r}";
}
