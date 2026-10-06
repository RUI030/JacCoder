import from main { smart_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = smart_sort([5, 3, 1, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = smart_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = smart_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 3, 3, 4];
    got = smart_sort([4, 3, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3];
    got = smart_sort([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [3, 5, 7, 9];
    got = smart_sort([9, 7, 5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 5, 5, 7, 9, 10];
    got = smart_sort([10, 9, 7, 5, 5, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [0, 1, 2, 3, 3, 3];
    got = smart_sort([1, 3, 2, 3, 3, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 5, 6, 7, 8, 9, 10];
    got = smart_sort([1, 10, 9, 8, 7, 6, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [-1, 2, 3, 4, 9];
    got = smart_sort([4, -1, 2, 9, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
