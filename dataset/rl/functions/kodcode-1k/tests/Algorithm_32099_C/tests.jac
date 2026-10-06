import from main { rolling_window_sum }

test "case 0" {
    want = [60, 90, 120];
    got = rolling_window_sum([10, 20, 30, 40, 50], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [20, 40, 60];
    got = rolling_window_sum([5, 15, 25, 35], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [48];
    got = rolling_window_sum([8, 16, 24], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [21];
    got = rolling_window_sum([1, 2, 3, 4, 5, 6], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = rolling_window_sum([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10];
    got = rolling_window_sum([10], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [10];
    got = rolling_window_sum([10], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 3, 4, 5];
    got = rolling_window_sum([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
