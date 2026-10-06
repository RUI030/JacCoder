import from main { recursive_sum }

test "case 0" {
    want = 0;
    got = recursive_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = recursive_sum([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = recursive_sum([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 2;
    got = recursive_sum([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = -10;
    got = recursive_sum([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 6;
    got = recursive_sum([1, 2, -3, 4, -6, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
