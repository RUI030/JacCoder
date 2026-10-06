import from main { reverse_words }

test "case 0" {
    want = 'The quick brown fox';
    got = reverse_words('The quick brown fox');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'The sky is blue';
    got = reverse_words('  The    sky  is   blue  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'hello world';
    got = reverse_words('  hello world  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'hello';
    got = reverse_words('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_words('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'hello';
    got = reverse_words('     hello     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}
