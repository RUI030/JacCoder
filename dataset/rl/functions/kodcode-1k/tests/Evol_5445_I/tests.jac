import from main { find_two_sum }

test "case 0" {
    want = [0, 1];
    got = find_two_sum([2, 7, 11, 15], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2];
    got = find_two_sum([3, 2, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1];
    got = find_two_sum([3, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = find_two_sum([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1];
    got = find_two_sum([5, 5, 3], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = find_two_sum([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = find_two_sum([3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
