import from main { longest_common_subsequence }

test "case 0" {
    want = 3;
    got = longest_common_subsequence('abcde', 'ace');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = longest_common_subsequence('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = longest_common_subsequence('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = longest_common_subsequence('', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = longest_common_subsequence('abcdef', 'zab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = longest_common_subsequence('aabbcc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = longest_common_subsequence('abcdabcd', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = longest_common_subsequence('abcdef', 'ghij');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = longest_common_subsequence('aaaa', 'bbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = longest_common_subsequence('abc', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 3;
    got = longest_common_subsequence('xyz', 'xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 4;
    got = longest_common_subsequence('abacbdab', 'bdcaba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = 0;
    got = longest_common_subsequence('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 1;
    got = longest_common_subsequence('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = 0;
    got = longest_common_subsequence('a', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 15" {
    want = 0;
    got = longest_common_subsequence('', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}
