import from main { move_common_to_left }

test "case 0" {
    want = [2, 4, 1, 3, 5];
    got = move_common_to_left([1, 2, 3, 4, 5], [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 2, 3];
    got = move_common_to_left([1, 2, 3], [4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = move_common_to_left([1, 2, 3], [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = move_common_to_left([1, 3, 4, 2, 5], [1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5, 3, 1, 2, 4];
    got = move_common_to_left([5, 2, 3, 4, 1], [5, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = move_common_to_left([], [2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3];
    got = move_common_to_left([1, 2, 3], []);
    assert got == want, f"expected={want!r} actual={got!r}";
}
