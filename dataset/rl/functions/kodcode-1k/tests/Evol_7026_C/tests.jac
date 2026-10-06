import from main { unique_numbers }

test "case 0" {
    want = [5, 4, 3, 2, 1];
    got = unique_numbers([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 4, 3, 2, 1];
    got = unique_numbers([1, 2, 2, 3, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4];
    got = unique_numbers([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = unique_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4, 5, 1, 2, 3];
    got = unique_numbers([5, 1, 2, 3, 2, 1, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
