import from main { max_unique_intersections }

test "case 0" {
    want = 4;
    got = max_unique_intersections(['N', 'E', 'S', 'W', 'N', 'E']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = max_unique_intersections(['N', 'N', 'E', 'E']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = max_unique_intersections(['N', 'E', 'S', 'W']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = max_unique_intersections(['N', 'E', 'S', 'W', 'S']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_unique_intersections([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = max_unique_intersections(['N', 'N', 'N', 'N']);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = max_unique_intersections(['N', 'E', 'S', 'W']);
    assert got == want, f"expected={want!r} actual={got!r}";
}
