import from main { min_ingredient_sum }

test "case 0" {
    want = [3];
    got = min_ingredient_sum(1, [(5, 3, 1, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4];
    got = min_ingredient_sum(1, [(4, 2, 2, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4];
    got = min_ingredient_sum(1, [(6, 4, 1, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [10];
    got = min_ingredient_sum(1, [(7, 5, 2, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 4, 4, 10];
    got = min_ingredient_sum(4, [(5, 3, 1, 5), (4, 2, 2, 4), (6, 4, 1, 3), (7, 5, 2, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
