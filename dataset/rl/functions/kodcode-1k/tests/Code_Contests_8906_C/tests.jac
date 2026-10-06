import from main { is_strictly_decreasing_possible }

test "case 0" {
    want = 'Possible';
    got = is_strictly_decreasing_possible(4, [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Impossible';
    got = is_strictly_decreasing_possible(5, [5, 5, 5, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Impossible';
    got = is_strictly_decreasing_possible(3, [3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Possible';
    got = is_strictly_decreasing_possible(1, [2000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Impossible';
    got = is_strictly_decreasing_possible(3, [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Impossible';
    got = is_strictly_decreasing_possible(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Possible';
    got = is_strictly_decreasing_possible(5, [10, 5, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
