import from main { max_difference_with_removal }

test "case 0" {
    want = 7;
    got = max_difference_with_removal([10, 3, 8, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = max_difference_with_removal([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 8;
    got = max_difference_with_removal([15, 7, 9, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = max_difference_with_removal([1, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = max_difference_with_removal([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_difference_with_removal([1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 400;
    got = max_difference_with_removal([100, 200, 300, 400, 500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 20;
    got = max_difference_with_removal([5, 10, 15, 20, 25]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
