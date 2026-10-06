import from main { calculate_influence_scores }

test "case 0" {
    want = [2, 2, 2, 1, 1];
    got = calculate_influence_scores(5, 4, [(1, 2), (1, 3), (2, 3), (4, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = calculate_influence_scores(1, 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 0, 0];
    got = calculate_influence_scores(3, 0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [3, 2, 2, 1];
    got = calculate_influence_scores(4, 4, [(1, 2), (1, 3), (1, 4), (2, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 2, 2];
    got = calculate_influence_scores(3, 3, [(1, 2), (1, 3), (2, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
