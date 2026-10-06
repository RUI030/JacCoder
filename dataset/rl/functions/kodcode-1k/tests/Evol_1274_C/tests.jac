import from main { smallest_lexicographical_substring }

test "case 0" {
    want = 'amm';
    got = smallest_lexicographical_substring('programming', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = smallest_lexicographical_substring('abc', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'abc';
    got = smallest_lexicographical_substring('abc', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = smallest_lexicographical_substring('abc', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'aa';
    got = smallest_lexicographical_substring('aaa', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Bc';
    got = smallest_lexicographical_substring('aBcDe', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '!b';
    got = smallest_lexicographical_substring('a!b#c$', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abcd';
    got = smallest_lexicographical_substring('abcdefghij', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
