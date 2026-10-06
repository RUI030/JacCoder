import from main { reverse_words }

test "case 0" {
    want = 'olleh dlrow';
    got = reverse_words('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'doog gninrom';
    got = reverse_words('good morning');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ',olleh !dlrow';
    got = reverse_words('hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'olleh !dlrow';
    got = reverse_words('hello world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'yadot si 3202';
    got = reverse_words('today is 2023');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'drow';
    got = reverse_words('word');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'emordnilap';
    got = reverse_words('palindrome');
    assert got == want, f"expected={want!r} actual={got!r}";
}
