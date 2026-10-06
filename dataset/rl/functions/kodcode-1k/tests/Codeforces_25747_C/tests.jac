import from main { min_height_binary_tree }

test "case 0" {
    want = 4;
    got = min_height_binary_tree(5, [3, 2, 1, 4, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = min_height_binary_tree(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 2;
    got = min_height_binary_tree(4, [2, 2, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = min_height_binary_tree(6, [1, 2, 2, 3, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = min_height_binary_tree(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = min_height_binary_tree(2, [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
