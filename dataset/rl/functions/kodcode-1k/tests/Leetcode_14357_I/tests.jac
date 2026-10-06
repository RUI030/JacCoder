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
    want = 'nihao';
    got = shuffle_string('aiohn', [3, 1, 4, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'arigatou';
    got = shuffle_string('aaiougrt', [4, 0, 2, 6, 7, 3, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'rat';
    got = shuffle_string('art', [1, 0, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '';
    got = shuffle_string('', []);
    assert got == want, f"expected={want!r} actual={got!r}";
}
