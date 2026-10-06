import from main { count_valid_subarrays }

test "case 0" {
    want = 8;
    got = count_valid_subarrays(10, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = count_valid_subarrays(5, 2, [2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = count_valid_subarrays(5, 2, [1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = count_valid_subarrays(5, 3, [2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = count_valid_subarrays(3, 3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = count_valid_subarrays(5, 5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = count_valid_subarrays(1, 1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = count_valid_subarrays(2, 2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 0;
    got = count_valid_subarrays(2, 2, [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
