import from main { find_error_nums }

test "case 0" {
    want = (2, 3);
    got = find_error_nums([1, 2, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (1, 2);
    got = find_error_nums([1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (2, 1);
    got = find_error_nums([2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (2, 1);
    got = find_error_nums([3, 2, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (5, 3);
    got = find_error_nums([5, 4, 2, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
