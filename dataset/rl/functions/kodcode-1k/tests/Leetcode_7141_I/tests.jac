import from main { find_contiguous_subarrays }

test "case 0" {
    want = [];
    got = find_contiguous_subarrays([1, 2, 3], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = find_contiguous_subarrays([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1, 2, 3]];
    got = find_contiguous_subarrays([1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[4]];
    got = find_contiguous_subarrays([4], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[1, 2], [2, 3], [3, 4], [4, 5]];
    got = find_contiguous_subarrays([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6]];
    got = find_contiguous_subarrays([1, 2, 3, 4, 5, 6], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 7], [5, 6, 7, 8]];
    got = find_contiguous_subarrays([1, 2, 3, 4, 5, 6, 7, 8], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
