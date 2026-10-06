import from main { find_two_sum }

test "case 0" {
    want = 'YES';
    got = find_two_sum([2, 7, 11, 15, -5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 'NO';
    got = find_two_sum([1, 2, 3, 4], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 'YES';
    got = find_two_sum([-1, -2, -3, -4], -5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 'NO';
    got = find_two_sum([1], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 'NO';
    got = find_two_sum([5, 7, 1, 2], 20);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 'NO';
    got = find_two_sum([0, 1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 'YES';
    got = find_two_sum([1, 2, 3, 4, 5], 9);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 'YES';
    got = find_two_sum([3, 3, 3, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 'YES';
    got = find_two_sum([2, 2, 2], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 'YES';
    got = find_two_sum([100000, -50000, 50000], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}
