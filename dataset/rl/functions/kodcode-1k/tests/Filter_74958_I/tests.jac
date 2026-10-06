import from main { find_nearest_occurrence }

test "case 0" {
    want = 1;
    got = find_nearest_occurrence([1, 2, 3, 2, 4, 2], 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = find_nearest_occurrence([1, 2, 3, 2, 4, 2], 2, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = find_nearest_occurrence([1, 2, 3, 2, 4, 2], 4, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = find_nearest_occurrence([1, 2, 3, 2, 4, 2], 5, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = find_nearest_occurrence([], 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = find_nearest_occurrence([1, 2, 3, 2, 4, 2], 2, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = find_nearest_occurrence([1, 2, 3, 2, 4, 2], 2, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = find_nearest_occurrence([1, 2, 2, 2, 3], 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = find_nearest_occurrence([1, 2, 2, 2, 3], 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = find_nearest_occurrence([], 2, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
