import from main { remove_duplicates }

test "case 0" {
    want = [];
    got = remove_duplicates([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3];
    got = remove_duplicates([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = remove_duplicates([1, 2, 2, 3, 4, 4, 5, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1];
    got = remove_duplicates([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4];
    got = remove_duplicates([1, 2, 1, 3, 2, 4, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, -1, 2, 3, 4];
    got = remove_duplicates([1, -1, 2, -1, 3, 2, 4, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
