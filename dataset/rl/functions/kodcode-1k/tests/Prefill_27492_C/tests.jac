import from main { sort_descending }

test "case 0" {
    want = [5, 4, 3, 2, 1];
    got = sort_descending([1, 3, 5, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [-1, -2, -3, -4, -5];
    got = sort_descending([-1, -3, -2, -5, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [5, 1, 0, -1, -5];
    got = sort_descending([1, -1, 0, 5, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 0];
    got = sort_descending([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 3, 2, 2, 1];
    got = sort_descending([2, 3, 2, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = sort_descending([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = sort_descending([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
