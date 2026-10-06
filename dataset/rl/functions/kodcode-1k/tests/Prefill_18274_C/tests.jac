import from main { repeat_chars }

test "case 0" {
    want = 'hheelllloo';
    got = repeat_chars('hello', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'aaa';
    got = repeat_chars('a', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = repeat_chars('', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'test';
    got = repeat_chars('test', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = repeat_chars('hello', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '!!!---???';
    got = repeat_chars('!-?', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'aa  bb';
    got = repeat_chars('a b', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
