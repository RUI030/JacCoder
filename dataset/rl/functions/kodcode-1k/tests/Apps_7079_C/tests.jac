import from main { can_fill_knights }

test "case 0" {
    want = ['YES', 'YES', 'NO'];
    got = can_fill_knights(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = ['YES'];
    got = can_fill_knights(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = ['YES', 'YES', 'NO'];
    got = can_fill_knights(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = ['YES', 'NO', 'YES'];
    got = can_fill_knights(3, [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = ['NO', 'YES'];
    got = can_fill_knights(2, [99, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = ['YES', 'YES', 'YES'];
    got = can_fill_knights(3, [2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = ['NO', 'NO', 'NO'];
    got = can_fill_knights(3, [3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
