import from main { word_with_most_unique_chars }

test "case 0" {
    want = 'algorithms';
    got = word_with_most_unique_chars('hello world algorithms are fun');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'abcde';
    got = word_with_most_unique_chars('abcde abcdf');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'university';
    got = word_with_most_unique_chars('university');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = word_with_most_unique_chars('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'aaaa';
    got = word_with_most_unique_chars('aaaa bbbb cccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abc';
    got = word_with_most_unique_chars('abc aab aba');
    assert got == want, f"expected={want!r} actual={got!r}";
}
