import from main { longest_contiguous_subarray }

test "case 0" {
    want = [1];
    got = longest_contiguous_subarray(1, [(1, [1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [6];
    got = longest_contiguous_subarray(1, [(6, [1, 2, 3, 4, 5, 6])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [6];
    got = longest_contiguous_subarray(1, [(6, [6, 5, 4, 3, 2, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [5];
    got = longest_contiguous_subarray(1, [(6, [1, 2, 3, 4, 5, 3])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5, 5];
    got = longest_contiguous_subarray(2, [(6, [1, 2, 3, 4, 5, 3]), (5, [5, 4, 3, 2, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = longest_contiguous_subarray(1, [(6, [1, 1, 1, 1, 1, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [2];
    got = longest_contiguous_subarray(1, [(6, [1, 3, 2, 5, 4, 6])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [2];
    got = longest_contiguous_subarray(1, [(8, [1, 2, 1, 2, 1, 2, 1, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
