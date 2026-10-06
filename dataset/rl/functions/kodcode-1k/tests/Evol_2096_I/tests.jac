import from main { longest_common_prefix }

test "case 0" {
    want = '';
    got = longest_common_prefix(['dog', 'racecar', 'car']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'fl';
    got = longest_common_prefix(['flower', 'flow', 'flight']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'test';
    got = longest_common_prefix(['test', 'test', 'test']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '';
    got = longest_common_prefix([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '';
    got = longest_common_prefix(['', '', '']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = longest_common_prefix(['', 'b', 'c']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'abc';
    got = longest_common_prefix(['abca', 'abc', 'abcca']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
