import from main { verify_buffer_structure }

test "case 0" {
    want = True;
    got = verify_buffer_structure(100, 4, 2, [5, 5], [20, 4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = verify_buffer_structure(100, 4, 2, [5, 5], [20, 4], 101);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = verify_buffer_structure(80, 4, 1, [20], [-4], 76);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = True;
    got = verify_buffer_structure(4, 4, 0, None, None, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = False;
    got = verify_buffer_structure(100, 4, 2, [5], [20, 4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = verify_buffer_structure(100, 4, 2, [5, 5], [21, 4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = verify_buffer_structure(100, 4, 2, [5, 0], [20, 4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = verify_buffer_structure(100, 4, 2, [5, 5], [20, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = False;
    got = verify_buffer_structure(100, 4, 1, None, [4], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = False;
    got = verify_buffer_structure(100, 4, 1, [5], [4], -1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
