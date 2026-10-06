import from main { insert_in_sorted_array }

test "case 0" {
    want = [3];
    got = insert_in_sorted_array([], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 1, 2, 4, 5];
    got = insert_in_sorted_array([1, 2, 4, 5], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = insert_in_sorted_array([1, 2, 3, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = insert_in_sorted_array([1, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 3, 4];
    got = insert_in_sorted_array([1, 2, 3, 4], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-5, -3, -2, -1];
    got = insert_in_sorted_array([-5, -3, -1], -2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-5, -4, -2, 0, 3];
    got = insert_in_sorted_array([-5, -2, 0, 3], -4);
    assert got == want, f"expected={want!r} actual={got!r}";
}
