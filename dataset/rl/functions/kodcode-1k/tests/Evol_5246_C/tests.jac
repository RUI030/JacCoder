import from main { cumulative_sum }

test "case 0" {
    want = [1, 3, 6, 10];
    got = cumulative_sum([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 3, 5, 5, 2];
    got = cumulative_sum([4, -1, 2, 0, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 0, 0, 0];
    got = cumulative_sum([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5];
    got = cumulative_sum([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-5];
    got = cumulative_sum([-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = cumulative_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1, -3, -6, -10];
    got = cumulative_sum([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
