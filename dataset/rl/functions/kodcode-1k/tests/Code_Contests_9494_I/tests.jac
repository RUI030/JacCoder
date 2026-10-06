import from main { min_segment_swaps }

test "case 0" {
    want = 1;
    got = min_segment_swaps([4, 3, 2, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_segment_swaps([1, 3, 5, 2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_segment_swaps([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = min_segment_swaps([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_segment_swaps([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = min_segment_swaps([2, 1, 4, 3, 6, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
