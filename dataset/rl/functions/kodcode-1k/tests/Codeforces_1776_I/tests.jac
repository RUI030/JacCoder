import from main { find_two_subarrays_with_sum_k }

test "case 0" {
    want = 'NO';
    got = find_two_subarrays_with_sum_k(5, 10, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'YES';
    got = find_two_subarrays_with_sum_k(5, 5, [1, 2, 2, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'NO';
    got = find_two_subarrays_with_sum_k(1, 3, [3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'YES';
    got = find_two_subarrays_with_sum_k(5, 0, [-1, 1, 2, -2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'YES';
    got = find_two_subarrays_with_sum_k(5, -5, [-1, -4, 1, -4, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = find_two_subarrays_with_sum_k(5, 11, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
