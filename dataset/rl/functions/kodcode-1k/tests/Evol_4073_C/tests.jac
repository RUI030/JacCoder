import from main { mergeSortedLists }

test "case 0" {
    want = [];
    got = mergeSortedLists([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3];
    got = mergeSortedLists([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = mergeSortedLists([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5, 6];
    got = mergeSortedLists([1, 3, 5], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 2, 3, 3, 4];
    got = mergeSortedLists([1, 2, 3], [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4];
    got = mergeSortedLists([1], [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 4];
    got = mergeSortedLists([1, 2, 3], [4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1000000000, 1000000001];
    got = mergeSortedLists([1000000000], [1000000001]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 3, 4, 5, 6, 7, 9];
    got = mergeSortedLists([1, 3, 5, 7, 9], [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
