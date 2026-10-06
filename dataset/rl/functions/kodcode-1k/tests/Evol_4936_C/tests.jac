import from main { longest_identical_char_substring }

test "case 0" {
    want = '';
    got = longest_identical_char_substring('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = longest_identical_char_substring('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'aa';
    got = longest_identical_char_substring('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aaaa';
    got = longest_identical_char_substring('aaaabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'bbb';
    got = longest_identical_char_substring('aabbbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'cccc';
    got = longest_identical_char_substring('aabbcccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'aaaa';
    got = longest_identical_char_substring('aabbbccdaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'a';
    got = longest_identical_char_substring('ababab');
    assert got == want, f"expected={want!r} actual={got!r}";
}
