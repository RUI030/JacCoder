import from main { unobstructed_view }

test "case 0" {
    want = 3;
    got = unobstructed_view([3, 4, 2, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = unobstructed_view([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = unobstructed_view([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = unobstructed_view([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = unobstructed_view([3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = unobstructed_view([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
