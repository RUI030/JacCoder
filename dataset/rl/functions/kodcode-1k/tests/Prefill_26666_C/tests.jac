import from main { fill_missing_numbers }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = fill_missing_numbers([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5, 6, 7];
    got = fill_missing_numbers([1, 2, 4, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [-3, -2, -1, 0, 1, 2, 3];
    got = fill_missing_numbers([-3, -2, 0, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 2, 3];
    got = fill_missing_numbers([0, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5];
    got = fill_missing_numbers([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = fill_missing_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-3, -2, -1, 0, 1, 2];
    got = fill_missing_numbers([-3, -1, 0, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
