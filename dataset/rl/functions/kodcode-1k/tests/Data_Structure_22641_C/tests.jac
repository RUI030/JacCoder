import from main { gnome_sort_count_swaps }

test "case 0" {
    want = ([-9, 2, 10, 34], 5);
    got = gnome_sort_count_swaps([34, 2, 10, -9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ([1, 2, 3, 4, 5], 0);
    got = gnome_sort_count_swaps([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ([1, 2, 3, 4, 5], 10);
    got = gnome_sort_count_swaps([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ([1], 0);
    got = gnome_sort_count_swaps([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ([1, 1, 2, 3, 3], 4);
    got = gnome_sort_count_swaps([1, 3, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ([], 0);
    got = gnome_sort_count_swaps([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ([-2, -1, 0, 1, 2, 3], 4);
    got = gnome_sort_count_swaps([-1, -2, 0, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
