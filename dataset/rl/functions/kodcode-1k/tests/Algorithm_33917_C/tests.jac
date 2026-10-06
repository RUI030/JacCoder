import from main { find_rotation_index }

test "case 0" {
    want = 0;
    got = find_rotation_index('abcde', 'abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = find_rotation_index('abcde', 'cdeab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = find_rotation_index('hello', 'lohel');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = find_rotation_index('abc', 'acb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = find_rotation_index('rotation', 'rotation');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = find_rotation_index('abcdef', 'abcdefg');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = find_rotation_index('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = find_rotation_index('abcdef', 'efabcd');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = find_rotation_index('abcdef', 'ghijkl');
    assert got == want, f"expected={want!r} actual={got!r}";
}
