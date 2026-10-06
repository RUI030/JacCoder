import from main { max_bond_strength }

test "case 0" {
    want = 15;
    got = max_bond_strength([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = max_bond_strength([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = max_bond_strength([1, -3, 2, 1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 7;
    got = max_bond_strength([-2, -3, 4, -1, -2, 1, 5, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = max_bond_strength([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -5;
    got = max_bond_strength([-5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_bond_strength([0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
