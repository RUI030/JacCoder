import from main { filter_even_and_greater_than_ten }

test "case 0" {
    want = [12, 24, 18];
    got = filter_even_and_greater_than_ten([1, 12, 15, 24, 7, 18, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [12, 14];
    got = filter_even_and_greater_than_ten([2, 4, 10, 12, 14]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = filter_even_and_greater_than_ten([1, 3, 5, 7, 9, 11, 13]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = filter_even_and_greater_than_ten([2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = filter_even_and_greater_than_ten([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [22];
    got = filter_even_and_greater_than_ten([-1, -12, 15, -24, 7, -18, 22]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = filter_even_and_greater_than_ten([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
