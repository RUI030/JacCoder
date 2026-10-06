import from main { gnome_sort }

test "case 0" {
    want = [-9, 2, 10, 34];
    got = gnome_sort([34, 2, 10, -9]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3, 4, 5];
    got = gnome_sort([5, 3, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1];
    got = gnome_sort([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = gnome_sort([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1, 2, 3, 4, 5];
    got = gnome_sort([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-5, -4, -3, -2, -1];
    got = gnome_sort([-5, -4, -3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 2, 3, 4, 5];
    got = gnome_sort([5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [6, 7, 8, 9, 10];
    got = gnome_sort([10, 9, 8, 7, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1, 2, 2, 4, 5];
    got = gnome_sort([4, 2, 5, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [3, 3, 3, 3, 3];
    got = gnome_sort([3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [1, 1, 1, 2, 2];
    got = gnome_sort([1, 2, 2, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 11" {
    want = [-1000000000, -999999999, 0, 999999999, 1000000000];
    got = gnome_sort([1000000000, -1000000000, 0, 999999999, -999999999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 12" {
    want = [-5, -3, -1, 2, 4];
    got = gnome_sort([-1, 2, -3, 4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 13" {
    want = [-2, -1, 0, 1, 2];
    got = gnome_sort([0, -1, 1, -2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
