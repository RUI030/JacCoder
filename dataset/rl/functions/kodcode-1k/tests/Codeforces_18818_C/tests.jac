import from main { minimum_swaps_to_sort_books }

test "case 0" {
    want = 0;
    got = minimum_swaps_to_sort_books(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = minimum_swaps_to_sort_books(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = minimum_swaps_to_sort_books(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = minimum_swaps_to_sort_books(5, [4, 3, 2, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = minimum_swaps_to_sort_books(5, [1, 3, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
