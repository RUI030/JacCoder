import from main { segregate_even_odd }

test "case 0" {
    want = [2, 4, 6, 1, 3, 5];
    got = segregate_even_odd([1, 2, 3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [12, 34, 8, 90, 45, 9, 3];
    got = segregate_even_odd([12, 34, 45, 9, 8, 90, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 2, -4, 1, -3, 5];
    got = segregate_even_odd([0, 1, 2, -3, -4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 4, 6, 8];
    got = segregate_even_odd([2, 4, 6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 3, 5, 7];
    got = segregate_even_odd([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = segregate_even_odd([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1];
    got = segregate_even_odd([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2];
    got = segregate_even_odd([2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
