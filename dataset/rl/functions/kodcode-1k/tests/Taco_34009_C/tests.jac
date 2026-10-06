import from main { is_contained }

test "case 0" {
    want = True;
    got = is_contained({1, 2, 3}, {3, 2, 4, 5, 1});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = False;
    got = is_contained({1, 2, 3, 4}, {2, 3, 4});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = True;
    got = is_contained({1, 2, 3}, {1, 2, 3});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = False;
    got = is_contained({1, 2, 3}, {4, 5, 6});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = True;
    got = is_contained({1}, {1, 2, 3});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = False;
    got = is_contained({4}, {1, 2, 3});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = True;
    got = is_contained(set(), {1, 2, 3});
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = False;
    got = is_contained({1, 2, 3}, set());
    assert got == want, f"expected={want!r} actual={got!r}";
}
