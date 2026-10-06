import from main { count_harmonious_pairs }

test "case 0" {
    want = 2;
    got = count_harmonious_pairs([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_harmonious_pairs([1, 3, 2, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = count_harmonious_pairs([1, 2, 3, 9], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = count_harmonious_pairs([1, 2, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = count_harmonious_pairs([-1, -2, 1, 2, 0], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
