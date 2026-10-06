import from main { find_difference }

test "case 0" {
    want = 'e';
    got = find_difference('abcd', 'abecd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'a';
    got = find_difference('xyz', 'xyaz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'a';
    got = find_difference('aaa', 'aaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'b';
    got = find_difference('a', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'd';
    got = find_difference('abc', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'y';
    got = find_difference('hello', 'heyllo');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 's';
    got = find_difference('stem', 'sstem');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'm';
    got = find_difference('stem', 'stemm');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'z';
    got = find_difference('', 'z');
    assert got == want, f"expected={want!r} actual={got!r}";
}
