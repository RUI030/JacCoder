import from main { longest_palindromic_subsequence }

test "case 0" {
    want = 7;
    got = longest_palindromic_subsequence('bbabcbcab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = longest_palindromic_subsequence('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_palindromic_subsequence('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = longest_palindromic_subsequence('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = longest_palindromic_subsequence('character');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_palindromic_subsequence('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = longest_palindromic_subsequence('aaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_palindromic_subsequence('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}
