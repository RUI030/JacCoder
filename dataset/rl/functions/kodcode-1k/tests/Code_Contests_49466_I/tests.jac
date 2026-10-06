import from main { smallest_possible_element }

test "case 0" {
    want = [15, 13, 24];
    got = smallest_possible_element(3, [(5, [1, 2, 3, 4, 5]), (3, [8, 1, 4]), (4, [9, 2, 9, 4])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [20, 10];
    got = smallest_possible_element(2, [(4, [5, 5, 5, 5]), (3, [3, 3, 4])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [9];
    got = smallest_possible_element(1, [(2, [7, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [50];
    got = smallest_possible_element(1, [(5, [10, 10, 10, 10, 10])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [6];
    got = smallest_possible_element(1, [(6, [1, 1, 1, 1, 1, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
