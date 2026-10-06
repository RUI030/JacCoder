import from main { reverse_words_and_letters }

test "case 0" {
    want = 'dlrow olleh';
    got = reverse_words_and_letters('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'retfa dna erofeb ecaps';
    got = reverse_words_and_letters('  space before and after  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'c b a';
    got = reverse_words_and_letters('a b c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'drowelgnis';
    got = reverse_words_and_letters('singleword');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverse_words_and_letters(' ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'fe dc ba';
    got = reverse_words_and_letters('ab cd ef');
    assert got == want, f"expected={want!r} actual={got!r}";
}
