import from main { reverse_words }

test "case 0" {
    want = 'blue is sky the';
    got = reverse_words('the sky is blue');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'world! hello';
    got = reverse_words('  hello world!  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'example good a';
    got = reverse_words('a good  example');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'hello';
    got = reverse_words('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverse_words('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'here. is world, hello!';
    got = reverse_words('hello! world, is here.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'World Hello';
    got = reverse_words('Hello World');
    assert got == want, f"expected={want!r} actual={got!r}";
}
