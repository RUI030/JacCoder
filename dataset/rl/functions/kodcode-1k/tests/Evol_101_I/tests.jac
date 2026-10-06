import from main { filter_and_sort }

test "case 0" {
    want = [2, 3, 4];
    got = filter_and_sort([1, 2, 3, 4, 5], 2, 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = filter_and_sort([1, 2, 3, 4, 5], 6, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = filter_and_sort([1, 2, 3, 4, 5], 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = filter_and_sort([], 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3, 5];
    got = filter_and_sort([5, 1, 3, 9, 2], 2, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-5, 0, 5];
    got = filter_and_sort([-10, -5, 0, 5, 10], -5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [3];
    got = filter_and_sort([3], 3, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = filter_and_sort([3], 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
