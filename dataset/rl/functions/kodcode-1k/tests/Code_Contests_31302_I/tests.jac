import from main { modify_sequence }

test "case 0" {
    want = [1, 3, 5, 7];
    got = modify_sequence(4, 2, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 6, 9, 12];
    got = modify_sequence(5, 3, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [3, 3, 3];
    got = modify_sequence(3, 1, [3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 3, 6, 10];
    got = modify_sequence(4, 4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 2, 2, 2];
    got = modify_sequence(5, 2, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [10];
    got = modify_sequence(1, 1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 3, 6, 9, 12, 15, 18, 21, 24, 27];
    got = modify_sequence(10, 3, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
