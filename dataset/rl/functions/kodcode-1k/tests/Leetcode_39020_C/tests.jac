import from main { rob }

test "case 0" {
    want = 0;
    got = rob([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 50;
    got = rob([50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 30;
    got = rob([20, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 30;
    got = rob([20, 30, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 50;
    got = rob([20, 10, 30]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 12;
    got = rob([2, 7, 9, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 20;
    got = rob([10, 1, 1, 10, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 41;
    got = rob([6, 7, 1, 30, 8, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 6000;
    got = rob([1000, 2000, 3000, 1000, 2000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 30;
    got = rob([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
