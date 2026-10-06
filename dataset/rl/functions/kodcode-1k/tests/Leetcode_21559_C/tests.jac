import from main { min_removals_to_k_distinct }

test "case 0" {
    want = 2;
    got = min_removals_to_k_distinct('aaabbcc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = min_removals_to_k_distinct('abcde', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_removals_to_k_distinct('aabbcc', 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = min_removals_to_k_distinct('aabbcc', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_removals_to_k_distinct('aaaabb', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = min_removals_to_k_distinct('a', 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = min_removals_to_k_distinct('a', 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = min_removals_to_k_distinct('', 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
