import from main { num_combinations }

test "case 0" {
    want = 4;
    got = num_combinations([1, 2, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = num_combinations([2, 3, 6, 7], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = num_combinations([2, 4, 6], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = num_combinations([3, 5, 7], 8);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = num_combinations([1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = num_combinations([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = num_combinations([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = num_combinations([5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 30;
    got = num_combinations([1, 2, 3, 4, 5], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}
