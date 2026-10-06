import from main { find_lis_length }

test "case 0" {
    want = 0;
    got = find_lis_length([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = find_lis_length([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = find_lis_length([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = find_lis_length([9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = find_lis_length([10, 9, 2, 5, 3, 7, 101, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = find_lis_length([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = find_lis_length([9, 7, 5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = find_lis_length([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = find_lis_length([3, 4, -1, 0, 6, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
