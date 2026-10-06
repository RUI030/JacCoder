import from main { max_paintings }

test "case 0" {
    want = 4;
    got = max_paintings(5, 15, [2, 3, 4, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_paintings(5, 2, [3, 4, 5, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = max_paintings(4, 10, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_paintings(5, 7, [5, 1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = max_paintings(3, 100000, [10000, 20000, 30000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_paintings(1, 5, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_paintings(1, 4, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
