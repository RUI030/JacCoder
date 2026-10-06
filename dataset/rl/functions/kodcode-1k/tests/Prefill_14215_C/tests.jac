import from main { find_list_with_most_elements_sum_to_target }

test "case 0" {
    want = [2, 2, 3, 4];
    got = find_list_with_most_elements_sum_to_target([1, 2, 3, 4], [2, 2, 3, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 2, 4];
    got = find_list_with_most_elements_sum_to_target([1, 2, 3, 4], [1, 2, 2, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 2, 2, 2];
    got = find_list_with_most_elements_sum_to_target([2, 2, 2, 2], [2, 2, 2, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4];
    got = find_list_with_most_elements_sum_to_target([1, 2, 3, 4], [1, 2, 3, 4], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = find_list_with_most_elements_sum_to_target([1, 2, 3, 4], [5, 6, 7, 8], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}
