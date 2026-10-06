import from main { is_xor_sequence }

test "case 0" {
    want = True;
    got = is_xor_sequence(1, 2, [1, 3, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = True;
    got = is_xor_sequence(5, 7, [5, 2, 5, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = False;
    got = is_xor_sequence(0, 1, [0, 1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = is_xor_sequence(4, 4, [4, 0, 4, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_xor_sequence(10, 15, [10, 5, 10, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_xor_sequence(3, 7, [3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_xor_sequence(1, 2, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = True;
    got = is_xor_sequence(1, 2, [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = is_xor_sequence(1, 2, [1, 3, 1, 3, 1, 3, 1, 2, 1, 3, 1, 3, 1, 3, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
