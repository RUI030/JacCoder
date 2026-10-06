import from main { find_pair_with_sum }

test "case 0" {
    want = 'YES';
    got = find_pair_with_sum([1, 2, 3, 4, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = find_pair_with_sum([1, 2, 3, 9], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = find_pair_with_sum([10, 15, 3, 7], 17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = find_pair_with_sum([1, 1, 1, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = find_pair_with_sum([1, -1, 2, -2], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'YES';
    got = find_pair_with_sum([1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'NO';
    got = find_pair_with_sum([5, 6, 7, 8], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
