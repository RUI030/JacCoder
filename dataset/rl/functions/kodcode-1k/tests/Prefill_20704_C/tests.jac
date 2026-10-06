import from main { reverse_array }

test "case 0" {
    want = [4, 3, 2, 1];
    got = reverse_array([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 4, 3, 2, 1];
    got = reverse_array([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = reverse_array([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = reverse_array([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 2, 2, 1];
    got = reverse_array([1, 2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
