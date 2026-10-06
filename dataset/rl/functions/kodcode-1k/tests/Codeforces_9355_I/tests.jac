import from main { min_removals_to_avoid_triplets }

test "case 0" {
    want = 0;
    got = min_removals_to_avoid_triplets('abcde');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_removals_to_avoid_triplets('aab');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_removals_to_avoid_triplets('aabbcc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = min_removals_to_avoid_triplets('aaabbb');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_removals_to_avoid_triplets('aaa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_removals_to_avoid_triplets('aaabbbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = min_removals_to_avoid_triplets('bbbaaabbbccc');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = min_removals_to_avoid_triplets('a');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = min_removals_to_avoid_triplets('aa');
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 1;
    got = min_removals_to_avoid_triplets('baaab');
    assert got == want, f"expected={want!r} actual={got!r}";
}
