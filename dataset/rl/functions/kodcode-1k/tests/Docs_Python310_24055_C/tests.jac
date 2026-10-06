import from main { process_strings }

test "case 0" {
    want = 'helloworld\x00\x00\x00\x00\x00';
    got = process_strings(['hello', 'world'], 15);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'foobarbaz';
    got = process_strings(['foo', 'bar', 'baz'], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'ab';
    got = process_strings(['abc', 'def'], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'helloworld';
    got = process_strings(['hello', 'world'], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '\x00\x00\x00\x00\x00';
    got = process_strings([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = process_strings(['hello', 'world'], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'he';
    got = process_strings(['hello'], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abcdef';
    got = process_strings(['a', 'bc', 'def'], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'abcdef\x00\x00';
    got = process_strings(['a', 'bc', 'def'], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}
