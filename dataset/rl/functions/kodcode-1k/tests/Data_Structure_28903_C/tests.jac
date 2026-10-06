import from main { custom_counting_sort }

test "case 0" {
    want = [-2, -1, 0, 1, 2, 3, 4, 4];
    got = custom_counting_sort([4, 2, -1, 3, 4, 1, 0, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = custom_counting_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-5, -4, -3, -2, -1];
    got = custom_counting_sort([-5, -1, -3, -2, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = custom_counting_sort([3, 1, 2, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = custom_counting_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 2, 2, 2, 2];
    got = custom_counting_sort([2, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000, -1000, 0, 1000, 1000];
    got = custom_counting_sort([-1000, 1000, 0, -1000, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-3, -2, -1, 0, 1, 2, 3];
    got = custom_counting_sort([-3, -2, -1, 0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 3, 4, 5];
    got = custom_counting_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
