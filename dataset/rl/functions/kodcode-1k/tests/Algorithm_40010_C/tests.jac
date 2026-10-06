import from main { calculate_trapped_rainwater }

test "case 0" {
    want = 6;
    got = calculate_trapped_rainwater([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 9;
    got = calculate_trapped_rainwater([4, 2, 0, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = calculate_trapped_rainwater([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = calculate_trapped_rainwater([1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = calculate_trapped_rainwater([2, 0, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = calculate_trapped_rainwater([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = calculate_trapped_rainwater([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = calculate_trapped_rainwater([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = calculate_trapped_rainwater([5, 4, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
