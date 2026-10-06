import from main { enhanced_shell_sort }

test "case 0" {
    want = [11, 12, 22, 25, 34, 64, 90];
    got = enhanced_shell_sort([64, 34, 25, 12, 22, 11, 90]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = enhanced_shell_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = enhanced_shell_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 1, 1, 2, 3, 3, 5, 9];
    got = enhanced_shell_sort([5, 3, 3, 2, 9, 1, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = enhanced_shell_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1, 2, 3, 4, 5];
    got = enhanced_shell_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-1000000000, 0, 500000000, 1000000000];
    got = enhanced_shell_sort([1000000000, -1000000000, 500000000, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-5, -4, -3, -2, -1];
    got = enhanced_shell_sort([-1, -3, -2, -5, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [-3, -1, 0, 2, 4];
    got = enhanced_shell_sort([-1, 2, -3, 4, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
