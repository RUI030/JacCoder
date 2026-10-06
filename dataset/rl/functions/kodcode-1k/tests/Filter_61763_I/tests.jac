import from main { extract_first_word }

test "case 0" {
    want = 'Hello';
    got = extract_first_word('Hello World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Leading';
    got = extract_first_word('   Leading spaces followed by text');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Amazing';
    got = extract_first_word('!Amazing start with punctuation.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = extract_first_word('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '123';
    got = extract_first_word('123 456 789');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'symbols';
    got = extract_first_word('@symbols in the beginning');
    assert got == want, f"expected={want!r} actual={got!r}";
}
