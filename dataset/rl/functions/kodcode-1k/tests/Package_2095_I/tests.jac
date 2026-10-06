import from main { frequency_sort }

test "case 0" {
    want = [2, 2, 2, 1, 1, 3, 3, 4];
    got = frequency_sort([1, 1, 2, 2, 2, 3, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5];
    got = frequency_sort([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4];
    got = frequency_sort([3, 1, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [7, 7, 7, 7];
    got = frequency_sort([7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-2, -2, -2, -1, -1, 2, 3];
    got = frequency_sort([-1, -2, -1, 3, 2, -2, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [5, 5, 5, 6, 6, 6, 2, 2, 4, 4];
    got = frequency_sort([4, 2, 2, 4, 5, 6, 6, 6, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = frequency_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
