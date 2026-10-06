import from main { longest_word }

test "case 0" {
    want = 'apple';
    got = longest_word(['a', 'banana', 'app', 'appl', 'ap', 'apply', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = longest_word(['banana', 'apply', 'apple']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'apple';
    got = longest_word(['a', 'b', 'app', 'appl', 'ap', 'apply', 'apple', 'bat']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aaa';
    got = longest_word(['a', 'aa', 'aaa', 'ab', 'abc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'a';
    got = longest_word(['a', 'c', 'b']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abcdefg';
    got = longest_word(['a', 'ab', 'abc', 'abcd', 'abcde', 'abcdef', 'abcdefg']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
