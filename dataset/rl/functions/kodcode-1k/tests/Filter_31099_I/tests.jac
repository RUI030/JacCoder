import from main { insert_and_remove_duplicates }

test "case 0" {
    want = [1, 2, 3];
    got = insert_and_remove_duplicates([1, 2, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = insert_and_remove_duplicates([1, 2, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4];
    got = insert_and_remove_duplicates([2, 3, 4], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4];
    got = insert_and_remove_duplicates([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4];
    got = insert_and_remove_duplicates([1, 3, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}
