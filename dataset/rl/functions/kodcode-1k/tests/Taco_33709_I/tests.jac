import from main { sort_odd_numbers }

test "case 0" {
    want = [4, 2, 6, 8];
    got = sort_odd_numbers([4, 2, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 5, 7, 9];
    got = sort_odd_numbers([9, 7, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 1, 2, 3, 5];
    got = sort_odd_numbers([4, 3, 2, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = sort_odd_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2];
    got = sort_odd_numbers([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = sort_odd_numbers([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [3, 6, 5, 8, 7, 2];
    got = sort_odd_numbers([7, 6, 5, 8, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
