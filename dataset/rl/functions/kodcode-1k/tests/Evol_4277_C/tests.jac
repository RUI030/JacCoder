import from main { reverse_words }

test "case 0" {
    want = 'olleH';
    got = reverse_words('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'olleH dlrow morf ecaps';
    got = reverse_words('Hello world from space');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ',olleH !dlrow';
    got = reverse_words('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'elpitluM secaps';
    got = reverse_words('Multiple     spaces');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'gnidoC segnellahc era nuf';
    got = reverse_words('Coding challenges are fun');
    assert got == want, f"expected={want!r} actual={got!r}";
}
