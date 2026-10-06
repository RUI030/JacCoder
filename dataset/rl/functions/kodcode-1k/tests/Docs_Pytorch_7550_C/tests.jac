import from main { is_broadcastable }

test "case 0" {
    want = (True, [3, 4]);
    got = is_broadcastable([3, 4], [3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (True, [3, 4]);
    got = is_broadcastable([3, 4], [1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (True, [3, 1, 7]);
    got = is_broadcastable([1], [3, 1, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (False, []);
    got = is_broadcastable([3, 4], [3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (False, []);
    got = is_broadcastable([2, 3], [5, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (True, [5, 3, 4, 1]);
    got = is_broadcastable([5, 3, 4, 1], [3, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (True, [8, 7, 6, 5]);
    got = is_broadcastable([8, 1, 6, 1], [7, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (True, []);
    got = is_broadcastable([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = (True, [5, 3, 4, 1]);
    got = is_broadcastable([5, 3, 4, 1], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = (True, [3, 1, 1]);
    got = is_broadcastable([], [3, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
