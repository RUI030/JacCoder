import from main { sort_by_second_element }

test "case 0" {
    want = [(2, 1), (1, 4), (3, 5), (4, 7)];
    got = sort_by_second_element([(3, 5), (2, 1), (4, 7), (1, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 2), (2, 2), (3, 2)];
    got = sort_by_second_element([(1, 2), (2, 2), (3, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = sort_by_second_element([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 5)];
    got = sort_by_second_element([(1, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(2, -3), (3, -2), (1, -1)];
    got = sort_by_second_element([(1, -1), (2, -3), (3, -2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
