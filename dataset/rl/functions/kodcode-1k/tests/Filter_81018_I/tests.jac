import from main { counting_sort }

test "case 0" {
    want = [];
    got = counting_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [42];
    got = counting_sort([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = counting_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = counting_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5, 6];
    got = counting_sort([3, 6, 1, 4, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 2, 3, 3, 4, 8];
    got = counting_sort([4, 2, 2, 8, 3, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
