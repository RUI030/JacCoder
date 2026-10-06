import from main { unique_paths_with_obstacles }

test "case 0" {
    want = 0;
    got = unique_paths_with_obstacles([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = unique_paths_with_obstacles([[0]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = unique_paths_with_obstacles([[1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = unique_paths_with_obstacles([[0, 0, 0], [0, 0, 0], [0, 0, 0]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = unique_paths_with_obstacles([[0, 0, 0], [0, 1, 0], [0, 0, 0]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = unique_paths_with_obstacles([[0, 1], [0, 0]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = unique_paths_with_obstacles([[1, 0], [0, 0]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = unique_paths_with_obstacles([[0, 0], [0, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
