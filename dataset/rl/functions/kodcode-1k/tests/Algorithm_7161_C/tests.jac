import from main { reverse_words }

test "case 0" {
    want = 'World! Hello,';
    got = reverse_words('Hello, World!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'fox brown quick The';
    got = reverse_words('The quick brown fox');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ' dog   lazy the  over   Jump  ';
    got = reverse_words('  Jump   over  the lazy   dog ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = "it? isn't amazing, It's";
    got = reverse_words("It's amazing, isn't it?");
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'One';
    got = reverse_words('One');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ' C B A ';
    got = reverse_words(' A B C ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '';
    got = reverse_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}
