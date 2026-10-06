import from main { smallest_m }

test "case 0" {
    want = 2;
    got = smallest_m([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = smallest_m([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7;
    got = smallest_m([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 11;
    got = smallest_m([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = smallest_m([1, 3, 6, 10, 11, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = smallest_m([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = smallest_m([1, 2, 5, 10, 20, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10;
    got = smallest_m([1, 2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = smallest_m([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
