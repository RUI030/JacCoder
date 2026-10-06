import from main { sort_integers }

test "case 0" {
    want = [];
    got = sort_integers([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5];
    got = sort_integers([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = sort_integers([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = sort_integers([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = sort_integers([3, 1, 4, 5, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-3, -1, 0, 2, 5];
    got = sort_integers([-1, -3, 2, 0, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 2, 3, 3];
    got = sort_integers([1, 3, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
