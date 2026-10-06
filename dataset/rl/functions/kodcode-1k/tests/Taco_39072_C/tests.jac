import from main { lexicographically_smallest_list }

test "case 0" {
    want = [1, 2, 3, 4, 5];
    got = lexicographically_smallest_list([4, 5, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = lexicographically_smallest_list([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = lexicographically_smallest_list([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = lexicographically_smallest_list([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 1, 999, 1000, 2000];
    got = lexicographically_smallest_list([1000, 2000, 0, 999, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
