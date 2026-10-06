import from main { extract_unique_words }

test "case 0" {
    want = [];
    got = extract_unique_words('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['hello'];
    got = extract_unique_words('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['hello', 'world'];
    got = extract_unique_words('Hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['hello'];
    got = extract_unique_words('Hello hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['hello', 'world'];
    got = extract_unique_words('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['hello', 'world'];
    got = extract_unique_words('Hello, WoRld! Hello...');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['brown', 'dog', 'fox', 'jumps', 'lazy', 'over', 'quick', 'the'];
    got = extract_unique_words('The quick, brown fox jumps over the lazy dog!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ['2', '3', 'and', 'apples', 'are', 'oranges', 'there'];
    got = extract_unique_words('There are 2 apples and 3 oranges.');
    assert got == want, f"expected={want!r} actual={got!r}";
}
