import from main { average }

test "case 0" {
    want = 3;
    got = average([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -3;
    got = average([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = average([-1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = None;
    got = average([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = average([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -5;
    got = average([-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = average([4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = average([3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
