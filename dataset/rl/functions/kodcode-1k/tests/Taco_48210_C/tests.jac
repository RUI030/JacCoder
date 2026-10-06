import from main { find_top_candidates }

test "case 0" {
    want = [2];
    got = find_top_candidates([10, 20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3];
    got = find_top_candidates([10, 10, 20, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 1, 2, 3];
    got = find_top_candidates([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 2];
    got = find_top_candidates([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0];
    got = find_top_candidates([1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 1];
    got = find_top_candidates([500, 500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1];
    got = find_top_candidates([0, 5, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
