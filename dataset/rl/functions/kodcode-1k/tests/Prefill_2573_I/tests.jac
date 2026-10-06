import from main { sort_in_wave }

test "case 0" {
    want = [6, 3, 10, 5, 20, 7];
    got = sort_in_wave([3, 6, 5, 10, 7, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [90, 10, 49, 1, 5, 2, 23];
    got = sort_in_wave([10, 90, 49, 2, 1, 5, 23]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [9, 7, 8, 5, 6, 4];
    got = sort_in_wave([9, 8, 7, 6, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 1, 4, 3, 6, 5];
    got = sort_in_wave([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = sort_in_wave([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 1];
    got = sort_in_wave([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = sort_in_wave([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
