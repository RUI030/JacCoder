import from main { min_length_after_removals }

test "case 0" {
    want = 1;
    got = min_length_after_removals('abcde', ['ab', 'cd']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = min_length_after_removals('abcde', ['fg', 'hi']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = min_length_after_removals('abcde', ['bc', 'e']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = min_length_after_removals('abcde', ['']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_length_after_removals('abba', ['a', 'b']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_length_after_removals('abcabc', ['abc', 'bc']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_length_after_removals('aaaa', ['a']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
