import from main { maximizeDifference }

test "case 0" {
    want = [4, 1, 3, 2];
    got = maximizeDifference([4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [10, 2, 9, 3, 8, 5];
    got = maximizeDifference([10, 5, 3, 8, 9, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-1, -4, -2, -3];
    got = maximizeDifference([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [6, 1, 5, 2, 4, 3];
    got = maximizeDifference([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-1, -6, -2, -5, -3, -4];
    got = maximizeDifference([-6, -5, -4, -3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [3, -2, 2, -1, 1, 0];
    got = maximizeDifference([0, -1, 1, -2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 1, 4, 1, 4, 1];
    got = maximizeDifference([4, 4, 4, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
