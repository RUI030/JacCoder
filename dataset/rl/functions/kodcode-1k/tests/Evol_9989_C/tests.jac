import from main { find_duplicates }

test "case 0" {
    want = [2, 3];
    got = find_duplicates([4, 3, 2, 7, 8, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = find_duplicates([1, 1, 2, 2, 3, 3, 4, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [3, 5, 10];
    got = find_duplicates([10, 10, 10, 5, 5, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = find_duplicates([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = find_duplicates([5, 6, 7, 8, 9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = find_duplicates([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = find_duplicates([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = find_duplicates([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-2, -1];
    got = find_duplicates([-1, -2, -3, -1, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [-1, 2, 4];
    got = find_duplicates([4, -1, 2, -1, 4, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [1000000];
    got = find_duplicates([1000000, 1000001, 1000000, 1000002]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [2147483647];
    got = find_duplicates([2147483647, 2147483647, -2147483648]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
