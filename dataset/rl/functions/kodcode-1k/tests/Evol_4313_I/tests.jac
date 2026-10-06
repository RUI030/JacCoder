import from main { differences_from_average }

test "case 0" {
    want = [-4.0, -2.0, 0.0, 2.0, 4.0];
    got = differences_from_average([10, 12, 14, 16, 18]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = differences_from_average([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0.0];
    got = differences_from_average([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0.0, 0.0, 0.0, 0.0];
    got = differences_from_average([7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10.0, 0.0, -10.0];
    got = differences_from_average([-10, -20, -30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1.0, -1.0, 1.0, -1.0];
    got = differences_from_average([1, -1, 1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
