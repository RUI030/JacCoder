import from main { optimized_bubble_sort }

test "case 0" {
    want = [1, 2, 4, 5, 8];
    got = optimized_bubble_sort([5, 1, 4, 2, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [11, 12, 22, 25, 34, 64, 90];
    got = optimized_bubble_sort([64, 34, 25, 12, 22, 11, 90]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-1, 0, 1, 2, 3, 4, 5];
    got = optimized_bubble_sort([3, 0, 2, 5, -1, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = optimized_bubble_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = optimized_bubble_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 1, 2, 2, 3, 3];
    got = optimized_bubble_sort([2, 3, 1, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1];
    got = optimized_bubble_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2];
    got = optimized_bubble_sort([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2];
    got = optimized_bubble_sort([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
