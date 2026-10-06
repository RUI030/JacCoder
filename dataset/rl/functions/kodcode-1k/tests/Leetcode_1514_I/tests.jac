import from main { shuffle_string }

test "case 0" {
    want = 'abc';
    got = shuffle_string('abc', [0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'cba';
    got = shuffle_string('abc', [2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '';
    got = shuffle_string('', []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'a';
    got = shuffle_string('a', [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'nihao';
    got = shuffle_string('aiohn', [3, 1, 4, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'aaaa';
    got = shuffle_string('aaaa', [3, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'zyxwvutsrqponmlkjihgfedcba';
    got = shuffle_string('abcdefghijklmnopqrstuvwxyz', [25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
