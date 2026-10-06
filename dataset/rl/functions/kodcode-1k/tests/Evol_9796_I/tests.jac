import from main { reverse_words }

test "case 0" {
    want = 'Hello';
    got = reverse_words('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'World Hello';
    got = reverse_words('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'fox brown quick The';
    got = reverse_words('The quick brown fox');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'World Hello';
    got = reverse_words('  Hello World  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'fox brown quick The';
    got = reverse_words('The   quick brown   fox');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
