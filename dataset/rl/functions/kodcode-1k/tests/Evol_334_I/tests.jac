import from main { unique_k_chars }

test "case 0" {
    want = 'ban';
    got = unique_k_chars('banana', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'ban';
    got = unique_k_chars('banana', 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Prog';
    got = unique_k_chars('Programming', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'helo';
    got = unique_k_chars('hello', 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'abc';
    got = unique_k_chars('abcdeabc', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a';
    got = unique_k_chars('aaaaaa', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = unique_k_chars('', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abcdef';
    got = unique_k_chars('abcdef', 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'abcde';
    got = unique_k_chars('abcdeabcdef', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
