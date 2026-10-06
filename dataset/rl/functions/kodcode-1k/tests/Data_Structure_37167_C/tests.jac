import from main { find_pattern }

test "case 0" {
    want = 5;
    got = find_pattern('abc', 'abdefabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = find_pattern('xyz', 'abcdefg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = find_pattern('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = find_pattern('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = find_pattern('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = find_pattern('abcdef', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = find_pattern('aaa', 'baaaabaaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = find_pattern('abc', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = find_pattern('abc', 'deabc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2;
    got = find_pattern('cd', 'abcdef');
    assert got == want, f"expected={want!r} actual={got!r}";
}
