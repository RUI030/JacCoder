import from main { max_nut_pieces }

test "case 0" {
    want = 6;
    got = max_nut_pieces(3, 3, [[1, 0, 1], [0, 1, 0], [1, 1, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = max_nut_pieces(2, 2, [[1, 0], [0, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 9;
    got = max_nut_pieces(3, 3, [[1, 1, 1], [1, 1, 1], [1, 1, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = max_nut_pieces(2, 2, [[0, 0], [0, 0]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 8;
    got = max_nut_pieces(4, 4, [[1, 0, 1, 0], [0, 1, 0, 1], [1, 0, 1, 0], [0, 1, 0, 1]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
