import from main { rearrange_unique_sorted }

test "case 0" {
    want = [1, 2, 3, 4];
    got = rearrange_unique_sorted([4, 3, 2, 4, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2];
    got = rearrange_unique_sorted([2, 1, 2, 1, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4, 5, 6];
    got = rearrange_unique_sorted([6, 5, 4, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = rearrange_unique_sorted([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5];
    got = rearrange_unique_sorted([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 4, 5, 6];
    got = rearrange_unique_sorted([2, 3, 3, 4, 5, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [7];
    got = rearrange_unique_sorted([7, 7, 7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
