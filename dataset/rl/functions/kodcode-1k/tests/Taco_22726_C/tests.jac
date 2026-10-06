import from main { final_number_after_transformations }

test "case 0" {
    want = [5, 7, 8];
    got = final_number_after_transformations(3, [(5, [3, 5, 2, 4, 1]), (4, [7, 7, 7, 7]), (6, [1, 8, 6, 7, 5, 3])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [3, 4];
    got = final_number_after_transformations(2, [(3, [1, 2, 3]), (2, [4, 4])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2];
    got = final_number_after_transformations(2, [(5, [1, 1, 1, 1, 1]), (6, [2, 2, 2, 2, 2, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [4];
    got = final_number_after_transformations(1, [(4, [4, 3, 2, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [9];
    got = final_number_after_transformations(1, [(2, [9, 1])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
