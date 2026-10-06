import from main { string_to_word_list }

test "case 0" {
    want = ['Hello', 'world'];
    got = string_to_word_list('Hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['Hello', 'world'];
    got = string_to_word_list('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['Hello', 'world'];
    got = string_to_word_list('Hello\nworld');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['Hello', 'world'];
    got = string_to_word_list('Hello   world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['Hello', 'world'];
    got = string_to_word_list('Hello,world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['Hello', 'world', 'This', 'is', 'a', 'test'];
    got = string_to_word_list('Hello, world!\nThis is a test.');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = string_to_word_list('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = string_to_word_list(',.!?;:');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = ['Hello', '123', 'world'];
    got = string_to_word_list('Hello 123 world');
    assert got == want, f"expected={want!r} actual={got!r}";
}
