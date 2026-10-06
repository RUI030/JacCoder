import from main { smallest_lexicographical_string }

test "case 0" {
    want = 'abcd';
    got = smallest_lexicographical_string(1, 'dcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'xyz';
    got = smallest_lexicographical_string(1, 'zyx');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'xzy';
    got = smallest_lexicographical_string(1, 'zxy');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'abc';
    got = smallest_lexicographical_string(1, 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'abcd';
    got = smallest_lexicographical_string(2, 'dcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'xyz';
    got = smallest_lexicographical_string(2, 'zyx');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'xyz';
    got = smallest_lexicographical_string(2, 'zxy');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'abcd';
    got = smallest_lexicographical_string(2, 'bacd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'a';
    got = smallest_lexicographical_string(1, 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'aaa';
    got = smallest_lexicographical_string(1, 'aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 'a';
    got = smallest_lexicographical_string(2, 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 'aabbc';
    got = smallest_lexicographical_string(3, 'abcba');
    assert got == want, f"expected={want!r} actual={got!r}";
}
