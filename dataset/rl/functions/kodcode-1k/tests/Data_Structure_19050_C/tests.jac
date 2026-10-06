import from main { reorganize_list }

test "case 0" {
    want = [1, 2, 3, 1, 2, 3];
    got = reorganize_list([1, 2, 3, 1, 2, 1, 2, 3], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [20, 37, 21];
    got = reorganize_list([20, 37, 20, 21], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 1, 3, 3, 7, 2, 2, 2];
    got = reorganize_list([1, 1, 3, 3, 7, 2, 2, 2, 2], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = reorganize_list([1, 2, 3, 4, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [5, 5];
    got = reorganize_list([5, 5, 5, 5, 5], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 1, 2, 3, 1, 2, 3];
    got = reorganize_list([1, 2, 1, 2, 3, 1, 2, 3], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [3, 3, 2, 2, 2, 1, 4, 3];
    got = reorganize_list([3, 3, 2, 2, 2, 1, 4, 3, 3, 3], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 2, 3, 4, 5];
    got = reorganize_list([1, 2, 3, 4, 5, 1, 2, 3, 4, 5], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
