import from main { min_deletions_to_match }

test "case 0" {
    want = 2;
    got = min_deletions_to_match('sea', 'eat');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = min_deletions_to_match('abc', 'def');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_deletions_to_match('', 'abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = min_deletions_to_match('abcdef', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_deletions_to_match('same', 'same');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = min_deletions_to_match('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_deletions_to_match('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = min_deletions_to_match('abc', 'ab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = min_deletions_to_match('axb', 'ayb');
    assert got == want, f"expected={want!r} actual={got!r}";
}
