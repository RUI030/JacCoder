import from main { even_integers_sorted }

test "case 0" {
    want = [];
    got = even_integers_sorted([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 4, 6, 8];
    got = even_integers_sorted([4, 1, 3, 2, 6, 9, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 4, 6, 10];
    got = even_integers_sorted([10, 4, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = even_integers_sorted([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-4, -2, 0, 8];
    got = even_integers_sorted([-4, -3, -2, 0, 5, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
