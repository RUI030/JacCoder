import from main { find_flag_sequence }

test "case 0" {
    want = 4;
    got = find_flag_sequence('a1b2c3d4e5f6', 'c3d');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = find_flag_sequence('a1b2c3d4e5f6', 'd5f');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = find_flag_sequence('abcde', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = find_flag_sequence('abcde', 'cde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = find_flag_sequence('', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = find_flag_sequence('abcde', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = find_flag_sequence('abcde', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = find_flag_sequence('abc', 'abcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = find_flag_sequence('aaaaaa', 'aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = find_flag_sequence('abcdefg', 'hij');
    assert got == want, f"expected={want!r} actual={got!r}";
}
