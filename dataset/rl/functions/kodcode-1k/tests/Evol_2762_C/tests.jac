import from main { reverse_words }

test "case 0" {
    want = 'test is this world hello';
    got = reverse_words('hello world this is test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hello';
    got = reverse_words('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'world hello';
    got = reverse_words('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'test test test test';
    got = reverse_words('test test test test');
    assert got == want, f"expected={want!r} actual={got!r}";
}
