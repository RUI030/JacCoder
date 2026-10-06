import from main { concatenate_strings }

test "case 0" {
    want = '';
    got = concatenate_strings([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Hello';
    got = concatenate_strings(['Hello']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Hello world';
    got = concatenate_strings(['Hello', 'world']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'This is a test';
    got = concatenate_strings(['This', 'is', 'a', 'test']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Hello  world';
    got = concatenate_strings(['Hello', '', 'world']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ' world';
    got = concatenate_strings(['', 'world']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Hello ';
    got = concatenate_strings(['Hello', '']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
