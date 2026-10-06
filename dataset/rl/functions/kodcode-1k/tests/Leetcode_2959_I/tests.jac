import from main { sunset_views }

test "case 0" {
    want = [];
    got = sunset_views([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = sunset_views([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4];
    got = sunset_views([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 2, 3, 4];
    got = sunset_views([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 4];
    got = sunset_views([3, 4, 2, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [3];
    got = sunset_views([5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [8];
    got = sunset_views([2, 3, 3, 5, 5, 1, 2, 2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
