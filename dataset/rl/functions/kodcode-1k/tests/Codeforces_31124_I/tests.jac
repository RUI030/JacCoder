import from main { max_fruits }

test "case 0" {
    want = 11;
    got = max_fruits(5, 3, [1, 3, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 15;
    got = max_fruits(8, 2, [4, 2, 1, 7, 8, 1, 2, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = max_fruits(1, 1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 10;
    got = max_fruits(4, 2, [5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = max_fruits(4, 4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = max_fruits(4, 1, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3000000;
    got = max_fruits(5, 3, [1000000, 1000000, 1000000, 1000000, 1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = max_fruits(5, 3, [0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 150;
    got = max_fruits(10, 3, [1, 1, 1, 1, 1, 50, 50, 50, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
