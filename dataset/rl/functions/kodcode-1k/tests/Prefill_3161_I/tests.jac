import from main { swap_elements }

test "case 0" {
    want = [1, 4, 3, 2];
    got = swap_elements([1, 2, 3, 4], 1, 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3, 4];
    got = swap_elements([1, 2, 3, 4], 2, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4];
    got = swap_elements([1, 2, 3, 4], 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4];
    got = swap_elements([1, 2, 3, 4], -1, 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = swap_elements([], 0, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = swap_elements([1], 0, 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
