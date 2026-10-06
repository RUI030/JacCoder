import from main { find_index }

test "case 0" {
    want = 3;
    got = find_index([1, 2, 3, 4, 5, 6], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = find_index([-10, -5, 0, 3, 7], -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 7;
    got = find_index([1, 2, 3, 4, 5, 6, 7, 8], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = find_index([10, 20, 30, 40, 50], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = find_index([10, 20, 30, 40, 50], 50);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = -1;
    got = find_index([1, 2, 3, 4, 5, 6], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = -1;
    got = find_index([-10, -5, 0, 3, 7], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = -1;
    got = find_index([1, 2, 3, 4, 5, 6, 7, 8], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = -1;
    got = find_index([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 0;
    got = find_index([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = -1;
    got = find_index([1], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = 0;
    got = find_index([2], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = -1;
    got = find_index([2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = 2;
    got = find_index([1000000000, 2000000000, 3000000000, 4000000000], 3000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 14" {
    want = -1;
    got = find_index([1000000000, 2000000000, 3000000000, 4000000000], -1000000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
