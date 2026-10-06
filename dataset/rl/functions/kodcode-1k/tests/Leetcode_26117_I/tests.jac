import from main { max_trapped_water }

test "case 0" {
    want = 0;
    got = max_trapped_water([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_trapped_water([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_trapped_water([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = max_trapped_water([1, 3, 2, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = max_trapped_water([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = max_trapped_water([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 49;
    got = max_trapped_water([1, 8, 6, 2, 5, 4, 8, 3, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
