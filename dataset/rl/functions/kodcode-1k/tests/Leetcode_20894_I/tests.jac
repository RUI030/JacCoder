import from main { reverse_each_word }

test "case 0" {
    want = 'olleh';
    got = reverse_each_word('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'olleh dlrow';
    got = reverse_each_word('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ' a b c d ';
    got = reverse_each_word(' a b c d ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'siht si a tset';
    got = reverse_each_word('this is a test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverse_each_word('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'a b c d e f';
    got = reverse_each_word('a b c d e f');
    assert got == want, f"expected={want!r} actual={got!r}";
}
