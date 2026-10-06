import from main { duplicate_consecutively }

test "case 0" {
    want = [];
    got = duplicate_consecutively([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 1];
    got = duplicate_consecutively([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 2, 2, 3, 3];
    got = duplicate_consecutively([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3];
    got = duplicate_consecutively([1, 1, 2, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-1, -1, 0, 0, 1, 1];
    got = duplicate_consecutively([-1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
