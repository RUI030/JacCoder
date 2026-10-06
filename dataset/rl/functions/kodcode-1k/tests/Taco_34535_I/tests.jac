import from main { check_sorted }

test "case 0" {
    want = 'Sorted';
    got = check_sorted(5, [1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'Unsorted';
    got = check_sorted(4, [1, 3, 2, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'Sorted';
    got = check_sorted(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'Sorted';
    got = check_sorted(5, [1, 2, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'Unsorted';
    got = check_sorted(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'Sorted';
    got = check_sorted(3, [-3, -2, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'Unsorted';
    got = check_sorted(3, [-1, -3, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'Sorted';
    got = check_sorted(3, [-100000, 0, 100000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'Unsorted';
    got = check_sorted(3, [-100000, 100000, -99999]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
