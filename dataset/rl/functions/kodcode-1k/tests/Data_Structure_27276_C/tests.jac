import from main { longest_palindromic_subsequence }

test "case 0" {
    want = 4;
    got = longest_palindromic_subsequence('bbbab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = longest_palindromic_subsequence('cbbd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_palindromic_subsequence('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_palindromic_subsequence('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = longest_palindromic_subsequence('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = longest_palindromic_subsequence('agbdba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = longest_palindromic_subsequence('Aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_palindromic_subsequence('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}
