import from main { min_boxes }

test "case 0" {
    want = 4;
    got = min_boxes([10, 20, 30, 40, 50], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = min_boxes([10, 10, 10, 10, 10, 10], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = min_boxes([5, 5, 5, 5, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = min_boxes([10], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_boxes([20, 20, 10], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_boxes([51, 52, 53], 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = min_boxes([1, 1, 1, 1, 1, 1, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = min_boxes([2, 2, 2, 2, 2, 2], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
