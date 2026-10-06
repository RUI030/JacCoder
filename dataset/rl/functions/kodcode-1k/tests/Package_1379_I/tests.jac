import from main { filter_even_numbers }

test "case 0" {
    want = [2, 4, 6];
    got = filter_even_numbers([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = filter_even_numbers([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 4, 6, 8];
    got = filter_even_numbers([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = filter_even_numbers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-2, 0, 2];
    got = filter_even_numbers([-3, -2, -1, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10000000];
    got = filter_even_numbers([10000000, 10000001]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
