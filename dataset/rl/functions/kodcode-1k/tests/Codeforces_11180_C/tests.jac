import from main { max_sum_with_one_removal }

test "case 0" {
    want = 4;
    got = max_sum_with_one_removal([1, -2, 0, 3, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = max_sum_with_one_removal([-1, -1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_sum_with_one_removal([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 15;
    got = max_sum_with_one_removal([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -1;
    got = max_sum_with_one_removal([-5, -4, -3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = max_sum_with_one_removal([3, -1, 2, -1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 25;
    got = max_sum_with_one_removal([10, -5, 10, -5, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = max_sum_with_one_removal([1, 0, -1, 2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
