import from main { max_sum_of_m_subarrays }

test "case 0" {
    want = 14;
    got = max_sum_of_m_subarrays([1, 2, 3, 4, 5], 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_sum_of_m_subarrays([1, 2, 3], 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 15;
    got = max_sum_of_m_subarrays([1, 2, 3, 4, 5, 6], 3, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 53;
    got = max_sum_of_m_subarrays([1, 2, 9, 10, 9, 8, 13, 4, 5], 3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 53;
    got = max_sum_of_m_subarrays([1, 2, 9, 10, 9, 8, 4, 13, 5], 3, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 9;
    got = max_sum_of_m_subarrays([1, 2, 3, 4], 1, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
