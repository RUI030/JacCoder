import from main { create_and_adjust_slice }

test "case 0" {
    want = (2, 5, 2, 2);
    got = create_and_adjust_slice(2, 10, 2, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (4, 5, 1, 1);
    got = create_and_adjust_slice(-1, 10, 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (0, 4, 1, 4);
    got = create_and_adjust_slice(-5, -1, 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (0, 4, 1, 4);
    got = create_and_adjust_slice(0, 4, 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (0, 5, 1, 5);
    got = create_and_adjust_slice(0, 5, 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = (0, 5, 1, 5);
    got = create_and_adjust_slice(0, 6, 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = (0, 5, 1, 5);
    got = create_and_adjust_slice(None, None, 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = (4, -1, -1, 5);
    got = create_and_adjust_slice(None, None, -1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = (4, 2, -1, 2);
    got = create_and_adjust_slice(None, 2, -1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = (2, -1, -1, 3);
    got = create_and_adjust_slice(2, None, -1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
