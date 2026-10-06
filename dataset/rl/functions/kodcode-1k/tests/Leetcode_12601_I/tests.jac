import from main { longest_alternating_string }

test "case 0" {
    want = 'a';
    got = longest_alternating_string('aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = longest_alternating_string('bbbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'ababab';
    got = longest_alternating_string('ababab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aba';
    got = longest_alternating_string('baba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'aba';
    got = longest_alternating_string('abbbbaaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = longest_alternating_string('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'a';
    got = longest_alternating_string('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '';
    got = longest_alternating_string('b');
    assert got == want, f"expected={want!r} actual={got!r}";
}
