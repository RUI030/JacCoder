import from main { count_distinct_permutations }

test "case 0" {
    want = 6;
    got = count_distinct_permutations('abc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_distinct_permutations('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = count_distinct_permutations('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = count_distinct_permutations('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3628800;
    got = count_distinct_permutations('abcdefghij');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = count_distinct_permutations('aAb');
    assert got == want, f"expected={want!r} actual={got!r}";
}
