import from main { optimize_skyline }

test "case 0" {
    want = [3, 2, 2, 2, 2];
    got = optimize_skyline([3, 2, 5, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 5, 5, 5];
    got = optimize_skyline([5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 1, 1, 1];
    got = optimize_skyline([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5, 4, 3, 2, 1];
    got = optimize_skyline([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = optimize_skyline([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = optimize_skyline([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2, 2, 2, 2, 2, 1];
    got = optimize_skyline([2, 3, 2, 3, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [10, 1, 1, 1, 1];
    got = optimize_skyline([10, 1, 10, 1, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [2, 2, 2, 2, 1];
    got = optimize_skyline([2, 10, 5, 15, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
