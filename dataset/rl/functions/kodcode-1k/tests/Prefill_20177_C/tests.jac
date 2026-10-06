import from main { substrings_in_reverse_order }

test "case 0" {
    want = ['a'];
    got = substrings_in_reverse_order('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['ab', 'a', 'b'];
    got = substrings_in_reverse_order('ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['abc', 'ab', 'bc', 'a', 'b', 'c'];
    got = substrings_in_reverse_order('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['aaa', 'aa', 'aa', 'a', 'a', 'a'];
    got = substrings_in_reverse_order('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = substrings_in_reverse_order('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['abca', 'abc', 'bca', 'ab', 'bc', 'ca', 'a', 'b', 'c', 'a'];
    got = substrings_in_reverse_order('abca');
    assert got == want, f"expected={want!r} actual={got!r}";
}
