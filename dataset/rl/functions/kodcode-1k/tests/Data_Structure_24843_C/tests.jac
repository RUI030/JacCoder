import from main { most_frequent_values }

test "case 0" {
    want = [1, 2];
    got = most_frequent_values([1, 1, 2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [5];
    got = most_frequent_values([5, 5, 5, 3, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = most_frequent_values([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [7, 8, 9, 10];
    got = most_frequent_values([7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [4];
    got = most_frequent_values([4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 1];
    got = most_frequent_values([2, 3, 2, 3, 2, 1, 1, 1, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [4, 5];
    got = most_frequent_values([1, 2, 3, 4, 4, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 3, 4, 5];
    got = most_frequent_values([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [100000, -100000];
    got = most_frequent_values([100000, 100000, -100000, -100000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [100000];
    got = most_frequent_values([-100000, -100000, 100000, 100000, 100000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [-1, 0];
    got = most_frequent_values([-1, -1, 0, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [0];
    got = most_frequent_values([0, 0, 0, 1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
