import from main { common_elements }

test "case 0" {
    want = [];
    got = common_elements([1, 2, 3], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 4];
    got = common_elements([1, 2, 3, 4], [3, 4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = common_elements([1, 2, 3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [2, 3];
    got = common_elements([1, 2, 2, 3, 4], [2, 3, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [3, 1, 4, 2];
    got = common_elements([5, 3, 1, 4, 2], [2, 1, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = common_elements([], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = common_elements([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [];
    got = common_elements([], [4, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [9];
    got = common_elements([7, 8, 9, 10], [9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [11];
    got = common_elements([11, 12, 13, 14], [15, 16, 11]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
