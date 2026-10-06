import from main { remove_palindromic_subsequences }

test "case 0" {
    want = 0;
    got = remove_palindromic_subsequences('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = remove_palindromic_subsequences('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = remove_palindromic_subsequences('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = remove_palindromic_subsequences('aba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = remove_palindromic_subsequences('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = remove_palindromic_subsequences('abab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = remove_palindromic_subsequences('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = remove_palindromic_subsequences('abca');
    assert got == want, f"expected={want!r} actual={got!r}";
}
