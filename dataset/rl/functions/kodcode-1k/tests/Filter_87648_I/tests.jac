import from main { sort_string }

test "case 0" {
    want = 'ehllo';
    got = sort_string('hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ' dehllloorw';
    got = sort_string('hello world');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = sort_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = sort_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'aaabnn';
    got = sort_string('banana');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Hello';
    got = sort_string('Hello');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '123abc';
    got = sort_string('a1b2c3');
    assert got == want, f"expected={want!r} actual={got!r}";
}
