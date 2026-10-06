import from main { highest_odd }

test "case 0" {
    want = 5;
    got = highest_odd([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = None;
    got = highest_odd([2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = highest_odd([1, 3, 5, 7, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = highest_odd([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = None;
    got = highest_odd([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 7;
    got = highest_odd([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = None;
    got = highest_odd([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5119;
    got = highest_odd([1023, 2048, 3071, 4096, 5119]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 9;
    got = highest_odd([5, 9, 5, 9, 5, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
