import from main { smallest_lexicographical_string }

test "case 0" {
    want = 'abc';
    got = smallest_lexicographical_string('abcde', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '';
    got = smallest_lexicographical_string('a', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'cba';
    got = smallest_lexicographical_string('edcba', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abc';
    got = smallest_lexicographical_string('bbabc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'aa';
    got = smallest_lexicographical_string('aaaa', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = smallest_lexicographical_string('abcde', 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'abcde';
    got = smallest_lexicographical_string('abcde', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
