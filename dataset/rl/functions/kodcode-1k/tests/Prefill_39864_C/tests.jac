import from main { min_number_from_digits }

test "case 0" {
    want = 2258;
    got = min_number_from_digits([5, 2, 2, 2, 8], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 13579;
    got = min_number_from_digits([1, 3, 5, 7, 9], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 246;
    got = min_number_from_digits([4, 4, 6, 6, 2, 2], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 224466;
    got = min_number_from_digits([4, 4, 6, 6, 2, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 33;
    got = min_number_from_digits([3, 3, 3, 3, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
