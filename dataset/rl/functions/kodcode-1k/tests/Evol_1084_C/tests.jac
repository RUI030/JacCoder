import from main { length_of_shortest_word }

test "case 0" {
    want = 3;
    got = length_of_shortest_word('The quick brown fox jumps over the lazy dog');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = length_of_shortest_word('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = length_of_shortest_word('This is a test sentence');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = length_of_shortest_word('dog cat bat rat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = length_of_shortest_word('a b c d e');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = length_of_shortest_word('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = length_of_shortest_word('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = length_of_shortest_word('   Leading and trailing spaces   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = length_of_shortest_word('Word with   mixed  spaces');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = length_of_shortest_word('Hello, world! This, is a test.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
