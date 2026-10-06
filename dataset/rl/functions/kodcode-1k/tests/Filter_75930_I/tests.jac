import from main { filter_even_numbers }

test "case 0" {
    want = [2, 4, 6, 8];
    got = filter_even_numbers([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 4, 6];
    got = filter_even_numbers([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = filter_even_numbers([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = filter_even_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-4, -2, 0, 4];
    got = filter_even_numbers([-4, -2, 0, 1, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
