import from main { filter_elements }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = filter_elements([1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 4, 5];
    got = filter_elements([1, 2, 2, 3, 3, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 4, 5];
    got = filter_elements([1, 2, 2, 3, 3, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = filter_elements([1, 1, 1, 1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = filter_elements([], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4];
    got = filter_elements([1, 2, 3, 4], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
