import from main { filter_numbers }

test "case 0" {
    want = [8, 10, 14, 20];
    got = filter_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 18, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [8, 14, 20];
    got = filter_numbers([2, 2, 5, 8, 8, 14, 14, 14, 20, 20, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = filter_numbers([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [8, 10, 14, 20];
    got = filter_numbers([8, 10, 14, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [14, 40, 100];
    got = filter_numbers([40, 21, 18, 14, 13, 109, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
