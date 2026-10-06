import from main { reverse_words_in_string }

test "case 0" {
    want = 'olleH dlroW';
    got = reverse_words_in_string('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'nohtyP si nuf';
    got = reverse_words_in_string('Python is fun');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a b c';
    got = reverse_words_in_string('a b c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverse_words_in_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'racecar';
    got = reverse_words_in_string('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}
