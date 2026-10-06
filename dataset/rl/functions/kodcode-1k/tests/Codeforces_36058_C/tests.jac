import from main { lexicographically_smallest_sequence }

test "case 0" {
    want = [1, 2, 3];
    got = lexicographically_smallest_sequence(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1, 3, 2, 4];
    got = lexicographically_smallest_sequence(4, [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4];
    got = lexicographically_smallest_sequence(4, [4, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 3, 2];
    got = lexicographically_smallest_sequence(3, [2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5, 5, 5, 5, 5];
    got = lexicographically_smallest_sequence(5, [5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [2, 3, 4, 6, 7, 5];
    got = lexicographically_smallest_sequence(6, [7, 3, 4, 6, 2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
