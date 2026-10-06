import from main { length_of_LIS }

test "case 0" {
    want = 4;
    got = length_of_LIS([10, 9, 2, 5, 3, 7, 101, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = length_of_LIS([0, 1, 0, 3, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = length_of_LIS([7, 7, 7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = length_of_LIS([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = length_of_LIS([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = length_of_LIS([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = length_of_LIS([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = length_of_LIS([10, 2, 5, 8, 3, 6, 9, 14]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
