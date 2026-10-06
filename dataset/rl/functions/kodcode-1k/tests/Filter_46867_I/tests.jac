import from main { insertion_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = insertion_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = insertion_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = insertion_sort([3, 1, 4, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 2, 3, 4, 4, 5];
    got = insertion_sort([4, 5, 3, 1, 4, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = insertion_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [42];
    got = insertion_sort([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
