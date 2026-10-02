import from main { second_largest }

test "empty" {
    want = None;
    got = second_largest([]);
    assert got is want, f"expected={want!r} actual={got!r}";
}

test "single" {
    want = None;
    got = second_largest([9]);
    assert got is want, f"expected={want!r} actual={got!r}";
}

test "max repeated" {
    want = 3;
    got = second_largest([7, 7, 7, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "negatives" {
    want = -3;
    got = second_largest([-1, -5, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "unsorted" {
    want = 40;
    got = second_largest([10, 50, 20, 50, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
