import from main { second_minimum }

test "case 0" {
    want = 2;
    got = second_minimum([4, 2, 6, 1, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = second_minimum([4, 2, 2, 1, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = None;
    got = second_minimum([5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = second_minimum([7, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = second_minimum([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = second_minimum([10, 1, 1, 2, 3, 4, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = second_minimum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = None;
    got = second_minimum([8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
