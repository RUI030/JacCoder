import from main { bubble_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = bubble_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 4, 5, 8];
    got = bubble_sort([5, 1, 4, 2, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3, 5, 7, 9];
    got = bubble_sort([9, 7, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [3, 3, 3, 3, 3];
    got = bubble_sort([3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = bubble_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = bubble_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
