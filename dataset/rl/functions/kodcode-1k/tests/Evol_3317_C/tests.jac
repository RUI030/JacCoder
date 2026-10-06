import from main { unique_descending }

test "case 0" {
    want = [];
    got = unique_descending([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = unique_descending([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 3, 2, 1];
    got = unique_descending([1, 3, 2, 1, 4, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5, 4, 3, 2, 1];
    got = unique_descending([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [30, 20, 10];
    got = unique_descending([10, 20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [3, 2, 1, -1, -2, -3];
    got = unique_descending([-1, -2, -3, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [42];
    got = unique_descending([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [100000, 99999, 99998];
    got = unique_descending([100000, 99999, 100000, 99998]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
