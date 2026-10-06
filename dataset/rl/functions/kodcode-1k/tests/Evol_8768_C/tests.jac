import from main { multiply_lists }

test "case 0" {
    want = [4, 10, 18];
    got = multiply_lists([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 10, 3];
    got = multiply_lists([1, 2, 3], [4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 10, 18, 7];
    got = multiply_lists([1, 2, 3], [4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4, 5, 6];
    got = multiply_lists([], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3];
    got = multiply_lists([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = multiply_lists([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 10, 18];
    got = multiply_lists([-1, -2, -3], [-4, -5, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-4, -10, -18];
    got = multiply_lists([-1, 2, -3], [4, -5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [0, 0, 0];
    got = multiply_lists([0, 2, 0], [4, 0, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
