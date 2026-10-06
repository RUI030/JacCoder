import from main { sort_and_deduplicate }

test "case 0" {
    want = [4, 3, 2, 1];
    got = sort_and_deduplicate([3, 1, 2, 3, 4, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5, 3, 2, 1];
    got = sort_and_deduplicate([5, 5, 3, 3, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [7, 6, 4, 2];
    got = sort_and_deduplicate([7, 7, 6, 6, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = sort_and_deduplicate([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10];
    got = sort_and_deduplicate([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = sort_and_deduplicate([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [0, -1, -2, -3];
    got = sort_and_deduplicate([-1, -2, -3, -1, -2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
