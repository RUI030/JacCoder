import from main { find_min_diff }

test "case 0" {
    want = 1;
    got = find_min_diff([1, 6, 11, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = find_min_diff([3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = find_min_diff([2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = find_min_diff([10, 20, 15, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = find_min_diff([8, 7, 5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = find_min_diff([2, 10, 15, 5, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = find_min_diff([100, 200, 300, 400]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = find_min_diff([1, 500, 500]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = find_min_diff([1, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = find_min_diff([10, 10, 10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 0;
    got = find_min_diff([3, 1, 4, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
