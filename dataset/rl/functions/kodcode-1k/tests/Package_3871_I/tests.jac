import from main { levenshtein_distance }

test "case 0" {
    want = 0;
    got = levenshtein_distance('kitten', 'kitten');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = levenshtein_distance('', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 6;
    got = levenshtein_distance('kitten', '');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = levenshtein_distance('', 'kitten');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = levenshtein_distance('kitten', 'sitting');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = levenshtein_distance('flaw', 'lawn');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = levenshtein_distance('a', 'b');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = levenshtein_distance('a', 'a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = levenshtein_distance('abc', 'xyz');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2;
    got = levenshtein_distance('abcd', 'abef');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 6;
    got = levenshtein_distance('short', 'longest');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 6;
    got = levenshtein_distance('longest', 'short');
    assert got == want, f"expected={want!r} actual={got!r}";
}
