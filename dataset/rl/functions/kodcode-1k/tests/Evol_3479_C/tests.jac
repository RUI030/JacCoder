import from main { reverse_words_in_string }

test "case 0" {
    want = 'olleH';
    got = reverse_words_in_string('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'olleH dlroW';
    got = reverse_words_in_string('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ',olleH !dlroW';
    got = reverse_words_in_string('Hello, World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverse_words_in_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'olleH dlroW';
    got = reverse_words_in_string('  Hello   World  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '321 654';
    got = reverse_words_in_string('123 456');
    assert got == want, f"expected={want!r} actual={got!r}";
}
