import from main { counting_sort }

test "case 0" {
    want = [];
    got = counting_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = counting_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0];
    got = counting_sort([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [-1];
    got = counting_sort([-1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = counting_sort([4, 2, 3, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 3, 3, 4];
    got = counting_sort([4, 2, 3, 3, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-5, -4, -3, -2, -1];
    got = counting_sort([-4, -2, -3, -5, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-3, -2, -1, -1, -1];
    got = counting_sort([-1, -1, -1, -2, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-3, -2, -1, 0, 1, 2, 4];
    got = counting_sort([-1, 2, -3, 4, 0, -2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [-1, 0, 1];
    got = counting_sort([0, -1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [-2, -1, 0, 2, 3];
    got = counting_sort([3, -1, -2, 0, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
