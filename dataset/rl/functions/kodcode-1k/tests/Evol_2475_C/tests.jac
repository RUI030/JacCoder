import from main { rob }

test "case 0" {
    want = 0;
    got = rob([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = rob([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = rob([2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 12;
    got = rob([2, 7, 9, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = rob([1, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = rob([2, 1, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 41;
    got = rob([6, 7, 1, 30, 8, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
