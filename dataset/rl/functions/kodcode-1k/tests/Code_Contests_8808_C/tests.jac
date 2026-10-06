import from main { minimum_deletions_palindrome }

test "case 0" {
    want = 1;
    got = minimum_deletions_palindrome('abcca');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = minimum_deletions_palindrome('abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = minimum_deletions_palindrome('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = minimum_deletions_palindrome('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = minimum_deletions_palindrome('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = minimum_deletions_palindrome('aba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = minimum_deletions_palindrome('abcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = minimum_deletions_palindrome('abcbad');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = minimum_deletions_palindrome('aabb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = minimum_deletions_palindrome('abcdeedcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}
