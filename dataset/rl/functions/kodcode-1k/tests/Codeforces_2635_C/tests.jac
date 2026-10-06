import from main { lexicographically_smallest_string }

test "case 0" {
    want = 'a';
    got = lexicographically_smallest_string('z');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'aaa';
    got = lexicographically_smallest_string('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'aab';
    got = lexicographically_smallest_string('dab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'aaa';
    got = lexicographically_smallest_string('baa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'axy';
    got = lexicographically_smallest_string('zxy');
    assert got == want, f"expected={want!r} actual={got!r}";
}
