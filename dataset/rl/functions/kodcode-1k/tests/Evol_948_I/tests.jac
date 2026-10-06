import from main { constrained_sort }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = constrained_sort([3, 4, 5, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = constrained_sort([5, 4, 3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 7];
    got = constrained_sort([3, 7, 4, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 5, 6];
    got = constrained_sort([1, 2, 3, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4, 5, 6, 7, 8];
    got = constrained_sort([4, 5, 6, 7, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = constrained_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 4];
    got = constrained_sort([2, 1, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
