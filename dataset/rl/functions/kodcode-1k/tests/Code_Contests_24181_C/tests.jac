import from main { remove_consecutive_duplicates }

test "case 0" {
    want = 'hello';
    got = remove_consecutive_duplicates('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hello world';
    got = remove_consecutive_duplicates('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'this is a test';
    got = remove_consecutive_duplicates('this is is a test test');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'one';
    got = remove_consecutive_duplicates('one one one one');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Hello hello';
    got = remove_consecutive_duplicates('Hello Hello hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = remove_consecutive_duplicates('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a b c';
    got = remove_consecutive_duplicates('a a a b b c c');
    assert got == want, f"expected={want!r} actual={got!r}";
}
