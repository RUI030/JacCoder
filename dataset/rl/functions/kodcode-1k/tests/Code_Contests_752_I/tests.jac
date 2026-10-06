import from main { max_wood_pieces }

test "case 0" {
    want = 3;
    got = max_wood_pieces(7, [4, 7, 2, 8, 6, 10, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = max_wood_pieces(5, [3, 5, 7, 9, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_wood_pieces(1, [2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = max_wood_pieces(1, [3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_wood_pieces(2, [2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = max_wood_pieces(2, [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = max_wood_pieces(3, [2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = max_wood_pieces(3, [1, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 3;
    got = max_wood_pieces(6, [1000, 1000, 1000, 1000, 1000, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 3;
    got = max_wood_pieces(5, [2, 3, 2, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
