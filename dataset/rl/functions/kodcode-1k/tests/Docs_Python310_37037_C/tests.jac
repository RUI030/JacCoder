import from main { count_bits_and_operate }

test "case 0" {
    want = ([(3, 2), (5, 2), (7, 3)], 7);
    got = count_bits_and_operate([3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ([(2, 1), (4, 1), (8, 1), (16, 1)], 0);
    got = count_bits_and_operate([2, 4, 8, 16]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ([(1, 1), (2, 1), (4, 1), (8, 1), (16, 1), (3, 2), (255, 8)], 0);
    got = count_bits_and_operate([1, 2, 4, 8, 16, 3, 255]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ([], 0);
    got = count_bits_and_operate([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ([(0, 0), (0, 0), (0, 0)], 0);
    got = count_bits_and_operate([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ([(1, 1), (1, 1), (1, 1)], 1);
    got = count_bits_and_operate([1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ([(1, 1), (3, 2), (5, 2), (6, 2), (7, 3)], 1);
    got = count_bits_and_operate([1, 3, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = ([(1073741823, 30), (2147483647, 31)], 2147483647);
    got = count_bits_and_operate([1073741823, 2147483647]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
