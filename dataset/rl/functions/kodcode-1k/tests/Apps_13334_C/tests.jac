import from main { reverse_words_in_sentence }

test "case 0" {
    want = 'olleH';
    got = reverse_words_in_sentence('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'ehT kciuq nworb xof';
    got = reverse_words_in_sentence('The quick brown fox');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a ba cba dcba';
    got = reverse_words_in_sentence('a ab abc abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'tset tset';
    got = reverse_words_in_sentence('test test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'tseT secaps';
    got = reverse_words_in_sentence('Test    spaces');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_words_in_sentence('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
