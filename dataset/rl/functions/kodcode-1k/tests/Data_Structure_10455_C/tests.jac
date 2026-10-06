import from main { find_optimal_index }

test "case 0" {
    want = -1;
    got = find_optimal_index([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_optimal_index([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = find_optimal_index([1, 1, 1, 0, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = find_optimal_index([1, 1, 0, 1, 1, 0, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = find_optimal_index([0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = find_optimal_index([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = find_optimal_index([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 3;
    got = find_optimal_index([1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 5;
    got = find_optimal_index([1, 0, 1, 0, 1, 0, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = find_optimal_index([0, 1, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = 3;
    got = find_optimal_index([1, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
