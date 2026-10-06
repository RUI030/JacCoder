import from main { three_sum }

test "case 0" {
    want = [];
    got = three_sum([1, 2, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[-1, -1, 2], [-1, 0, 1]];
    got = three_sum([-1, 0, 1, 2, -1, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[-2, 0, 2]];
    got = three_sum([-2, 0, 0, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = three_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = three_sum([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [[0, 0, 0]];
    got = three_sum([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
