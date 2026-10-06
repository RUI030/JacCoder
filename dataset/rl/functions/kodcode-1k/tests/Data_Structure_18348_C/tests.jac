import from main { increment_digits }

test "case 0" {
    want = [1, 2, 4];
    got = increment_digits([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 0, 0, 0];
    got = increment_digits([9, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = increment_digits([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 0];
    got = increment_digits([9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 0, 0];
    got = increment_digits([1, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 9];
    got = increment_digits([1, 2, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [0, 2, 0];
    got = increment_digits([0, 1, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 0, 0, 0, 0];
    got = increment_digits([9, 9, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
