import from main { find_max_min }

test "case 0" {
    want = (5, 1);
    got = find_max_min([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = (1, 1);
    got = find_max_min([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = (-1, -5);
    got = find_max_min([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = (3, -4);
    got = find_max_min([1, -1, 0, 3, -4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = (1, 1);
    got = find_max_min([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = None;
    got = find_max_min([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
