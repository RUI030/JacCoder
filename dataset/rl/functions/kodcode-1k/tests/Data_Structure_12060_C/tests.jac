import from main { enhanced_selection_sort }

test "case 0" {
    want = [];
    got = enhanced_selection_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = enhanced_selection_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = enhanced_selection_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = enhanced_selection_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [11, 12, 22, 25, 64];
    got = enhanced_selection_sort([64, 25, 12, 22, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 2, 3, 3];
    got = enhanced_selection_sort([3, 3, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000, 0, 1000000];
    got = enhanced_selection_sort([1000000, -1000000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-2, -1, 0, 2, 3];
    got = enhanced_selection_sort([2, -1, 3, 0, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
