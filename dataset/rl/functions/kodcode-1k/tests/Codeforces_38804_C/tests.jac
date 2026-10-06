import from main { max_pebbles }

test "case 0" {
    want = 2;
    got = max_pebbles(5, 5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_pebbles(4, 8, [1, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_pebbles(1, 5, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = max_pebbles(1, 2, [5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = max_pebbles(4, 50, [10, 20, 5, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 5;
    got = max_pebbles(5, 15, [3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 4;
    got = max_pebbles(4, 10, [2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = max_pebbles(3, 6, [2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
