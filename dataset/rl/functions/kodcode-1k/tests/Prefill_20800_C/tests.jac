import from main { frequent_numbers }

test "case 0" {
    want = [];
    got = frequent_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = frequent_numbers([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 3];
    got = frequent_numbers([1, 1, 1, 2, 2, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4];
    got = frequent_numbers([4, 4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5, 4];
    got = frequent_numbers([5, 5, 5, 1, 2, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
