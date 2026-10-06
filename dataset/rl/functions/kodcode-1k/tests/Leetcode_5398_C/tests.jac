import from main { find_pivot_index }

test "case 0" {
    want = 0;
    got = find_pivot_index([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_pivot_index([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = find_pivot_index([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = find_pivot_index([4, 5, 6, 7, 0, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = find_pivot_index([30, 40, 50, 10, 20]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = find_pivot_index([10, 20, 30, 40, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = find_pivot_index([40, 50, 10, 20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = find_pivot_index([15, 18, 2, 3, 6, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = find_pivot_index([7, 8, 9, 1, 2, 3, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = -1;
    got = find_pivot_index([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 1;
    got = find_pivot_index([10, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 9;
    got = find_pivot_index([2, 3, 4, 5, 6, 7, 8, 9, 10, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
