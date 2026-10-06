import from main { reverseWords }

test "case 0" {
    want = 'SingleWord';
    got = reverseWords('    SingleWord  ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'test a is This world! Hello';
    got = reverseWords('   Hello    world! This  is a test   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'day every Code';
    got = reverseWords('Code every day');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = reverseWords('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverseWords('     ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'world! Hello,';
    got = reverseWords('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'd c b a';
    got = reverseWords('   a   b  c d ');
    assert got == want, f"expected={want!r} actual={got!r}";
}
