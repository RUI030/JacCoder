import from main { k_most_frequent_elements }

test "case 0" {
    want = [1, 2];
    got = k_most_frequent_elements([1, 1, 1, 2, 2, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = k_most_frequent_elements([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [3, 1, 2];
    got = k_most_frequent_elements([3, 3, 3, 1, 1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4];
    got = k_most_frequent_elements([4], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2];
    got = k_most_frequent_elements([1, 2, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2];
    got = k_most_frequent_elements([3, 1, 2], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 4, 5];
    got = k_most_frequent_elements([5, 5, 4, 4, 1, 1, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}
