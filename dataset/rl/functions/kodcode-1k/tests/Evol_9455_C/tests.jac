import from main { sum_of_unique_abs_pairs }

test "case 0" {
    want = 6;
    got = sum_of_unique_abs_pairs([1, -1, 2, -2, 3, 1, -1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 6;
    got = sum_of_unique_abs_pairs([3, -3, -3, 3, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = sum_of_unique_abs_pairs([1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = sum_of_unique_abs_pairs([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = sum_of_unique_abs_pairs([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = sum_of_unique_abs_pairs([1, -1, -1, -1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = sum_of_unique_abs_pairs([0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 10;
    got = sum_of_unique_abs_pairs([5, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 200;
    got = sum_of_unique_abs_pairs([100, -100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 30;
    got = sum_of_unique_abs_pairs([1, -1, 2, -2, 3, -3, 4, 5, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
