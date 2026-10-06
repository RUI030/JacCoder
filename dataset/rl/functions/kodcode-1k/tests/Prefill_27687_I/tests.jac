import from main { longest_common_subsequence }

test "case 0" {
    want = 'ace';
    got = longest_common_subsequence('abcde', 'ace');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abc';
    got = longest_common_subsequence('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = longest_common_subsequence('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = longest_common_subsequence('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = longest_common_subsequence('abc', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = longest_common_subsequence('', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'adh';
    got = longest_common_subsequence('abcdgh', 'aedfhr');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'gtab';
    got = longest_common_subsequence('aggtab', 'gxtxayb');
    assert got == want, f"expected={want!r} actual={got!r}";
}
