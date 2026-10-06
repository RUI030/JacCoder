import from main { segment_avg }

test "case 0" {
    want = [2.0, 3.0, 4.0];
    got = segment_avg([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = segment_avg([1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = segment_avg([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5.0];
    got = segment_avg([5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = segment_avg([5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1.0, 1.0, 1.0];
    got = segment_avg([1, 1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [0.0, 0.0, 0.0, 0.0];
    got = segment_avg([0, 0, 0, 0, 0], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-1.5, -2.5, -3.5];
    got = segment_avg([-1, -2, -3, -4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-0.5, 0.5, -0.5, 0.5];
    got = segment_avg([1, -2, 3, -4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [0.6666666666666666, -1.0, 1.3333333333333333];
    got = segment_avg([1, -2, 3, -4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
