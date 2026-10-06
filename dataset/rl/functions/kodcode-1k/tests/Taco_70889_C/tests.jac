import from main { cumulative_sum }

test "case 0" {
    want = [1, 3, 6, 10];
    got = cumulative_sum([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5];
    got = cumulative_sum([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = cumulative_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-1, -3, -6, -10];
    got = cumulative_sum([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 0, 2, 0];
    got = cumulative_sum([1, -1, 2, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 0, 0, 0];
    got = cumulative_sum([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1000, 3000, 6000, 10000];
    got = cumulative_sum([1000, 2000, 3000, 4000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
