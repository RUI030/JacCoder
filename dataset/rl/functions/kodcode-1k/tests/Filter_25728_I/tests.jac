import from main { remove_duplicates }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = remove_duplicates([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4, 5];
    got = remove_duplicates([1, 2, 2, 3, 4, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [5];
    got = remove_duplicates([5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = remove_duplicates([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [10];
    got = remove_duplicates([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
