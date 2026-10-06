import from main { reverse_words_with_punctuation }

test "case 0" {
    want = 'Hello!';
    got = reverse_words_with_punctuation('Hello!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'world! Hello,';
    got = reverse_words_with_punctuation('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'much! very Python, love I';
    got = reverse_words_with_punctuation('I love Python, very much!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'coding. Enjoy';
    got = reverse_words_with_punctuation('Enjoy coding.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '!c !b !a';
    got = reverse_words_with_punctuation('!a !b !c');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = "up? What's Hi.";
    got = reverse_words_with_punctuation("Hi. What's up?");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'coding. Enjoy';
    got = reverse_words_with_punctuation(' Enjoy coding. ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'spaces trailing and Leading';
    got = reverse_words_with_punctuation('  Leading and trailing spaces  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '';
    got = reverse_words_with_punctuation('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
