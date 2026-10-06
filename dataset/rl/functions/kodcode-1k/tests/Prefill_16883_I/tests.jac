import from main { concatenate_reverse }

test "case 0" {
    want = 'worldhello';
    got = concatenate_reverse('hello', 'world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'hello';
    got = concatenate_reverse('hello', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'world';
    got = concatenate_reverse('', 'world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = concatenate_reverse('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '!@#hello';
    got = concatenate_reverse('hello', '!@#');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'abc123';
    got = concatenate_reverse('123', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'bar foo';
    got = concatenate_reverse('foo', 'bar ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'bar foo';
    got = concatenate_reverse(' foo', 'bar');
    assert got == want, f"expected={want!r} actual={got!r}";
}
