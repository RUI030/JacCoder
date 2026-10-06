import from main { minimum_swaps }

test "case 0" {
    want = 2;
    got = minimum_swaps([4, 3, 2, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = minimum_swaps([1, 3, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = minimum_swaps([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = minimum_swaps([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = minimum_swaps([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = minimum_swaps([3, 1, 2, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
