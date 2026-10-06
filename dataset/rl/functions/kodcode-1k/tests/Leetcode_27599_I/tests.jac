import from main { remove_k_digits }

test "case 0" {
    want = '345';
    got = remove_k_digits([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = '1';
    got = remove_k_digits([0, 0, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = '0';
    got = remove_k_digits([1, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = '961';
    got = remove_k_digits([9, 2, 3, 5, 6, 1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = '456';
    got = remove_k_digits([4, 5, 6], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = '4';
    got = remove_k_digits([4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = '0';
    got = remove_k_digits([4], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = '0';
    got = remove_k_digits([0, 0, 0, 0], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = '0';
    got = remove_k_digits([0, 0, 0], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
