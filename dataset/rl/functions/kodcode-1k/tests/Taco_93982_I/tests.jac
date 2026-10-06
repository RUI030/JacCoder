import from main { merge_arrays }

test "case 0" {
    want = [1, 3, 4, 5, 6, 7];
    got = merge_arrays([3, 5, 7], [1, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3];
    got = merge_arrays([], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = merge_arrays([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 1, 1, 1, 1, 1];
    got = merge_arrays([1, 1, 1], [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5, 6, 8, 10];
    got = merge_arrays([1, 3, 5], [2, 4, 6, 8, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2];
    got = merge_arrays([2], [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000, 1000000];
    got = merge_arrays([1000000], [-1000000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
