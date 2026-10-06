import from main { bubble_sort }

test "case 0" {
    want = [1, 1, 3, 4, 5];
    got = bubble_sort(5, [3, 1, 4, 1, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [2, 3, 7, 10];
    got = bubble_sort(4, [10, 3, 2, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [1, 2, 3];
    got = bubble_sort(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 2, 3, 4];
    got = bubble_sort(4, [4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [42];
    got = bubble_sort(1, [42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = bubble_sort(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [-4, -3, -2, -1];
    got = bubble_sort(4, [-3, -1, -4, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-5, -1, 0, 3, 10];
    got = bubble_sort(5, [3, -1, 0, 10, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
