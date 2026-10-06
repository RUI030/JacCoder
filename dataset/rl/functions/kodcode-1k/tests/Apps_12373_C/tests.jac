import from main { reverseWords }

test "case 0" {
    want = 'world! Hello';
    got = reverseWords('Hello world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Coding Keep';
    got = reverseWords(' Keep  Coding');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'inputs the Test';
    got = reverseWords('Test the  inputs');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'spaces Multiple';
    got = reverseWords('Multiple   spaces');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = reverseWords('   ');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = reverseWords('');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'word';
    got = reverseWords('word');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'world! Hello,';
    got = reverseWords('Hello, world!');
    assert got == want, f"expected={want!r} actual={got!r}";
}
