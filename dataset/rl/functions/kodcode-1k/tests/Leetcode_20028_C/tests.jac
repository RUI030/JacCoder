import from main { is_balanced }

test "case 0" {
    want = True;
    got = is_balanced([1, 2, 3, 4, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_balanced([1, 2, 3, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_balanced([1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_balanced([1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_balanced([2, 1, 1, 2, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = True;
    got = is_balanced([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_balanced([1000000, 500000, 500000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
