import from main { min_palindrome_cuts }

test "case 0" {
    want = 1;
    got = min_palindrome_cuts('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_palindrome_cuts('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_palindrome_cuts('banana');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_palindrome_cuts('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_palindrome_cuts('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = min_palindrome_cuts('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_palindrome_cuts('abab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = min_palindrome_cuts('ababc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = min_palindrome_cuts('noonabbad');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = min_palindrome_cuts('abcdeffedcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = min_palindrome_cuts('abcdefgfedcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 0;
    got = min_palindrome_cuts('aaaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = min_palindrome_cuts('aabbaabbaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 0;
    got = min_palindrome_cuts('aabbaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}
