import from main { shift_array_right }

test "case 0" {
    want = [5, 1, 2, 3, 4];
    got = shift_array_right(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [99, -1, -100];
    got = shift_array_right(3, [-1, -100, 99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [42];
    got = shift_array_right(1, [42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 4, 3, 2];
    got = shift_array_right(4, [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = shift_array_right(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 1000, -1000];
    got = shift_array_right(3, [1000, -1000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [7, 7, 7, 7];
    got = shift_array_right(4, [7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
