import from main { increment_digit_array }

test "case 0" {
    want = [1, 2, 4];
    got = increment_digit_array([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 0];
    got = increment_digit_array([1, 2, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 0];
    got = increment_digit_array([9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 0, 0];
    got = increment_digit_array([9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 0, 0, 0];
    got = increment_digit_array([9, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = increment_digit_array([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 3, 2, 2];
    got = increment_digit_array([4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 9, 0, 0];
    got = increment_digit_array([1, 8, 9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [0, 1, 0];
    got = increment_digit_array([0, 0, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [1, 0, 0, 0, 1];
    got = increment_digit_array([1, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
