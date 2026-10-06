import from main { lexicographically_smallest_substring }

test "case 0" {
    want = 'ab';
    got = lexicographically_smallest_substring('abcde', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'az';
    got = lexicographically_smallest_substring('azbzcz', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'aaa';
    got = lexicographically_smallest_substring('aaaaa', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abc';
    got = lexicographically_smallest_substring('abc', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = lexicographically_smallest_substring('abc', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = lexicographically_smallest_substring('abcde', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'ay';
    got = lexicographically_smallest_substring('zayxb', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
