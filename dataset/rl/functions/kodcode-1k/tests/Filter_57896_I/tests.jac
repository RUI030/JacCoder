import from main { insertion_sort }

test "case 0" {
    want = [1, 2, 5, 5, 6, 9];
    got = insertion_sort([5, 2, 9, 1, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = insertion_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = insertion_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2];
    got = insertion_sort([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3];
    got = insertion_sort([3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [5, 5, 5, 5];
    got = insertion_sort([5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 3, 5, 7, 9];
    got = insertion_sort([9, 7, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-5, -3, -2, -1];
    got = insertion_sort([-1, -3, -2, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 1, 2, 2, 3, 3];
    got = insertion_sort([3, 3, 2, 2, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
