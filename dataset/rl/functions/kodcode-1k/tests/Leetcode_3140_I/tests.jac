import from main { can_sort_by_adjacent_swaps }

test "case 0" {
    want = True;
    got = can_sort_by_adjacent_swaps([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = can_sort_by_adjacent_swaps([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = can_sort_by_adjacent_swaps([3, 5, 2, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = can_sort_by_adjacent_swaps([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = can_sort_by_adjacent_swaps([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = can_sort_by_adjacent_swaps([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
