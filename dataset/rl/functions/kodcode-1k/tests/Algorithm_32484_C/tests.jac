import from main { factor_pairs }

test "case 0" {
    want = [];
    got = factor_pairs(13);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(2, 6), (3, 4)];
    got = factor_pairs(12);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(5, 5)];
    got = factor_pairs(25);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = factor_pairs(7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(2, 50), (4, 25), (5, 20), (10, 10)];
    got = factor_pairs(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = factor_pairs(17);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(2, 8), (4, 4)];
    got = factor_pairs(16);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = factor_pairs(2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
