import from main { delete_all_occurrences }

test "case 0" {
    want = [1, 2, 3, 4];
    got = delete_all_occurrences([1, 2, 5, 3, 5, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = delete_all_occurrences([1, 2, 3, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = delete_all_occurrences([5, 5, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3];
    got = delete_all_occurrences([5, 1, 5, 2, 5, 3, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = delete_all_occurrences([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = delete_all_occurrences([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = delete_all_occurrences([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1];
    got = delete_all_occurrences([1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 3];
    got = delete_all_occurrences([1, 2, 3, 5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}
