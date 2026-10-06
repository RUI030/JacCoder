import from main { max_bloomed_buds }

test "case 0" {
    want = 4;
    got = max_bloomed_buds(5, 10, [2, 2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = max_bloomed_buds(4, 5, [5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_bloomed_buds(6, 15, [1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = max_bloomed_buds(3, 7, [2, 4, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = max_bloomed_buds(7, 20, [5, 8, 3, 2, 9, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_bloomed_buds(5, 2, [3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = max_bloomed_buds(5, 15, [3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
