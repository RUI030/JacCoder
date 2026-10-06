import from main { count_subarrays_with_sum }

test "case 0" {
    want = 1;
    got = count_subarrays_with_sum([3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_subarrays_with_sum([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = count_subarrays_with_sum([3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count_subarrays_with_sum([5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = count_subarrays_with_sum([1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = count_subarrays_with_sum([1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_subarrays_with_sum([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_subarrays_with_sum([2, 2, 2], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = count_subarrays_with_sum([1, 2, 1, 2, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
