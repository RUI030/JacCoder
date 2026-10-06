import from main { special_sort }

test "case 0" {
    want = [1, 3, 2, 8, 5, 4];
    got = special_sort([5, 3, 2, 8, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 5, 7, 9];
    got = special_sort([9, 7, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 4, 6, 8];
    got = special_sort([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [10, 1, 8, 3, 6, 5, 4, 7, 2, 9];
    got = special_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = special_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2];
    got = special_sort([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000001, 1000000000, 1000000001, -1000000000];
    got = special_sort([-1000000001, 1000000000, 1000000001, -1000000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = special_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
