import from main { compress_array }

test "case 0" {
    want = [1, 2, 3, 2, 1];
    got = compress_array([1, 2, 2, 3, 3, 3, 2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4];
    got = compress_array([4, 4, 4, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = compress_array([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5, 1, 2];
    got = compress_array([1, 1, 2, 3, 3, 4, 4, 5, 5, 5, 1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = compress_array([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [7];
    got = compress_array([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [5, 6];
    got = compress_array([5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [9];
    got = compress_array([9, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
