import from main { exchange_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = exchange_sort([3, 2, 5, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    got = exchange_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2];
    got = exchange_sort([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = exchange_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = exchange_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4, 4, 4, 4];
    got = exchange_sort([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 4, 5];
    got = exchange_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-5, -1, 2, 3, 7];
    got = exchange_sort([-1, 3, -5, 7, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-5, -2, 0, 1, 3, 4, 6, 7, 8, 10];
    got = exchange_sort([10, 1, 0, -5, 7, 3, 4, -2, 8, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [-9999, -1000, 0, 3, 1000, 5000, 10000];
    got = exchange_sort([1000, -1000, 5000, 0, 3, -9999, 10000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
