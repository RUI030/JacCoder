import from main { tasks_completed_and_max_time }

test "case 0" {
    want = (3, 6);
    got = tasks_completed_and_max_time([3, 4, 5], [2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (2, 6);
    got = tasks_completed_and_max_time([3, 1, 5], [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (0, 0);
    got = tasks_completed_and_max_time([1, 1, 1], [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (3, 6);
    got = tasks_completed_and_max_time([5, 5, 5], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (3, 9);
    got = tasks_completed_and_max_time([2, 3, 4], [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
