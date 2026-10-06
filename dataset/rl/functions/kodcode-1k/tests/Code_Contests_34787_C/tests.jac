import from main { maxHeightDifference }

test "case 0" {
    want = 6;
    got = maxHeightDifference([3, 7, 12, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = maxHeightDifference([1, 3, 6, 10, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = maxHeightDifference([-1, -5, -10, -20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 17;
    got = maxHeightDifference([-2, 4, -7, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = maxHeightDifference([5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = maxHeightDifference([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = maxHeightDifference([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2000;
    got = maxHeightDifference([-1000, 1000, -500, 500, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
