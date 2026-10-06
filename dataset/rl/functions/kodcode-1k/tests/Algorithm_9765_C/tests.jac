import from main { find_shortest_subarray }

test "case 0" {
    want = 5;
    got = find_shortest_subarray([2, 6, 4, 8, 10, 9, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = find_shortest_subarray([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = find_shortest_subarray([1, 3, 5, 2, 4, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = find_shortest_subarray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 10;
    got = find_shortest_subarray([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = find_shortest_subarray([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = find_shortest_subarray([2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = find_shortest_subarray([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
