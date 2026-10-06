import from main { four_sum }

test "case 0" {
    want = [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]];
    got = four_sum([1, 0, -1, 0, -2, 2], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = four_sum([1, 2, 3, 4], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = four_sum([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[0, 0, 0, 0]];
    got = four_sum([0, 0, 0, 0, 0], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[2, 2, 2, 2]];
    got = four_sum([2, 2, 2, 2, 2], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [[-3, -2, 2, 3], [-3, -1, 1, 3], [-3, 0, 0, 3], [-3, 0, 1, 2], [-2, -1, 0, 3], [-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]];
    got = four_sum([-3, -2, -1, 0, 0, 1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [[-5, 0, 4, 5], [-3, -2, 4, 5]];
    got = four_sum([-5, 5, 4, -3, 0, 0, 4, -2], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
