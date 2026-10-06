import from main { min_boxes }

test "case 0" {
    want = 3;
    got = min_boxes(5, 10, [2, 3, 7, 8, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_boxes(4, 5, [4, 2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = min_boxes(5, 5, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = min_boxes(1, 10, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_boxes(6, 15, [3, 1, 5, 7, 9, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_boxes(7, 20, [5, 5, 5, 10, 15, 6, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
