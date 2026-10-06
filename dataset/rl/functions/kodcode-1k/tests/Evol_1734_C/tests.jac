import from main { string_lengths }

test "case 0" {
    want = {'hello': 5};
    got = string_lengths(['hello']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = {'hello': 5, 'world': 5};
    got = string_lengths(['hello', 'world']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = {'test': 4};
    got = string_lengths(['test', 'test']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = {};
    got = string_lengths([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = {'a': 1, 'ab': 2, 'abc': 3};
    got = string_lengths(['a', 'ab', 'abc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = {'Hello': 5, 'HELLO': 5, 'hello!': 6, '@hello': 6};
    got = string_lengths(['Hello', 'HELLO', 'hello!', '@hello']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
