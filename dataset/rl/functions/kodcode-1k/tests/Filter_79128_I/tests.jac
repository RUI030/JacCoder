import from main { find_max_index }

test "case 0" {
    want = 3;
    got = find_max_index([1, 3, 2, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = find_max_index([10, 20, 30, 40, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = find_max_index([10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -1;
    got = find_max_index([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = find_max_index([1, 3, 2, 5, 5, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = find_max_index([5, 3, 5, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 3;
    got = find_max_index([-10, -20, -30, -5, -15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = find_max_index([3, -1, 4, -3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
