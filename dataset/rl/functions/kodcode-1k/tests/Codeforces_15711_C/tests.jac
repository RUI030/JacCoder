import from main { longest_palindromic_word }

test "case 0" {
    want = 'malayalam';
    got = longest_palindromic_word('madam arora teaches malayalam');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = longest_palindromic_word('nurses run');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'level';
    got = longest_palindromic_word('abc cba level noon civic');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = longest_palindromic_word('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'racecar';
    got = longest_palindromic_word('racecar');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'madam';
    got = longest_palindromic_word('anna wow madam');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'edivide';
    got = longest_palindromic_word('abcba def edivide hannah');
    assert got == want, f"expected={want!r} actual={got!r}";
}
