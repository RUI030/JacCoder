import from main { double_positives }

test "case 0" {
    want = [2, 4, 6, 8];
    got = double_positives([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [-1, -2, -3, -4];
    got = double_positives([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 0, 0];
    got = double_positives([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, -2, 6, 0, -4, 10];
    got = double_positives([1, -2, 3, 0, -4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = double_positives([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [6];
    got = double_positives([3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-3];
    got = double_positives([-3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [0];
    got = double_positives([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
