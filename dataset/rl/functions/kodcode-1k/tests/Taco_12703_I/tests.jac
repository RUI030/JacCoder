import from main { max_non_adjacent_sum }

test "case 0" {
    want = 5;
    got = max_non_adjacent_sum([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = max_non_adjacent_sum([3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 5;
    got = max_non_adjacent_sum([2, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 15;
    got = max_non_adjacent_sum([3, 2, 5, 10, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 6;
    got = max_non_adjacent_sum([2, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 13;
    got = max_non_adjacent_sum([3, 2, 7, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = max_non_adjacent_sum([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 0;
    got = max_non_adjacent_sum([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2000;
    got = max_non_adjacent_sum([1000, 1000, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 2000;
    got = max_non_adjacent_sum([1, 1000, 1, 1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
