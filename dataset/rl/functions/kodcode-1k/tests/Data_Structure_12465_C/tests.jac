import from main { two_sum_with_edge_cases }

test "case 0" {
    want = (0, 1);
    got = two_sum_with_edge_cases([2, 7, 11, 15], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (1, 2);
    got = two_sum_with_edge_cases([3, 2, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (0, 1);
    got = two_sum_with_edge_cases([3, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = None;
    got = two_sum_with_edge_cases([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = two_sum_with_edge_cases([], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = None;
    got = two_sum_with_edge_cases([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (1, 3);
    got = two_sum_with_edge_cases([1, 5, 1, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (1, 2);
    got = two_sum_with_edge_cases([1, 3, 3, 4], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = (0, 2);
    got = two_sum_with_edge_cases([1000000, 500, 499, 1], 1000499);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = (0, 2);
    got = two_sum_with_edge_cases([-1000000, -500, -499, -1], -1000499);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = (0, 1);
    got = two_sum_with_edge_cases([1, -1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = (0, 1);
    got = two_sum_with_edge_cases([1, 1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
