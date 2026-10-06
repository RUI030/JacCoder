import from main { largestRectangleArea }

test "case 0" {
    want = 10;
    got = largestRectangleArea([2, 1, 5, 6, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = largestRectangleArea([2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 12;
    got = largestRectangleArea([6, 2, 5, 4, 5, 1, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = largestRectangleArea([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = largestRectangleArea([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 12;
    got = largestRectangleArea([3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 9;
    got = largestRectangleArea([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 9;
    got = largestRectangleArea([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
