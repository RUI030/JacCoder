import from main { move_zeros_to_end }

test "case 0" {
    want = [1, 3, 12, 0, 0];
    got = move_zeros_to_end([0, 1, 0, 3, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = move_zeros_to_end([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 0, 0, 0];
    got = move_zeros_to_end([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 1, 0];
    got = move_zeros_to_end([0, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 1, 3, 12, 0, 0, 0];
    got = move_zeros_to_end([1, 0, 1, 0, 3, 0, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 0];
    got = move_zeros_to_end([1, 2, 3, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = move_zeros_to_end([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [0];
    got = move_zeros_to_end([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1];
    got = move_zeros_to_end([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
