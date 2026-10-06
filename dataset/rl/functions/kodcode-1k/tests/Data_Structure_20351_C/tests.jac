import from main { shell_sort }

test "case 0" {
    want = [];
    got = shell_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = shell_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3, 4, 5];
    got = shell_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4, 5];
    got = shell_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [2, 3, 12, 34, 54];
    got = shell_sort([12, 34, 54, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [11, 12, 22, 25, 34, 64, 90];
    got = shell_sort([64, 34, 25, 12, 22, 11, 90]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 3, 4];
    got = shell_sort([4, 3, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [1, 1, 1, 1, 1];
    got = shell_sort([1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
