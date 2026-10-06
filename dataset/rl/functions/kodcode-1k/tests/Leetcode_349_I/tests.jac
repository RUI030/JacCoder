import from main { max_sum_of_k_consecutive }

test "case 0" {
    want = 9;
    got = max_sum_of_k_consecutive([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = max_sum_of_k_consecutive([1, 2, 3, 4, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = -1;
    got = max_sum_of_k_consecutive([1, 2, 3, 4, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = max_sum_of_k_consecutive([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -3;
    got = max_sum_of_k_consecutive([-1, -2, -3, -4, -5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -2;
    got = max_sum_of_k_consecutive([-1, -2, -3, -4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = max_sum_of_k_consecutive([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = max_sum_of_k_consecutive([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = max_sum_of_k_consecutive([-1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
