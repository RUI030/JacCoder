import from main { k_most_frequent }

test "case 0" {
    want = [3, 2, 1];
    got = k_most_frequent(7, 3, [4, 1, 2, 2, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [4, 5];
    got = k_most_frequent(8, 2, [5, 5, 5, 4, 4, 4, 3, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = k_most_frequent(1, 1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2];
    got = k_most_frequent(4, 2, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 2, 1];
    got = k_most_frequent(6, 3, [1, 2, 2, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [4, 5];
    got = k_most_frequent(5, 2, [4, 4, 5, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
