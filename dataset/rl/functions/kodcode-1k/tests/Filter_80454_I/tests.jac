import from main { sum_of_list }

test "case 0" {
    want = 15;
    got = sum_of_list([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = sum_of_list([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = sum_of_list([10, -10, 5, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 100;
    got = sum_of_list([100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -15;
    got = sum_of_list([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
