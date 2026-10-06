import from main { find_n_most_frequent_elements }

test "case 0" {
    want = [1, 2];
    got = find_n_most_frequent_elements([1, 1, 1, 2, 2, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = find_n_most_frequent_elements([1, 1, 1, 2, 2, 3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 4];
    got = find_n_most_frequent_elements([4, 4, 1, 1, 2, 2, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3];
    got = find_n_most_frequent_elements([1, 2, 3, 4, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = find_n_most_frequent_elements([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = find_n_most_frequent_elements([1, 2, 3, 4, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 3, 2, 1];
    got = find_n_most_frequent_elements([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
