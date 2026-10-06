import from main { count_distinct_special_words }

test "case 0" {
    want = 1;
    got = count_distinct_special_words(1, [0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 1;
    got = count_distinct_special_words(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = count_distinct_special_words(3, [1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = count_distinct_special_words(4, [1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = count_distinct_special_words(3, [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = count_distinct_special_words(4, [0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 5;
    got = count_distinct_special_words(5, [1, 1, 0, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 6;
    got = count_distinct_special_words(6, [0, 1, 0, 1, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 6;
    got = count_distinct_special_words(6, [1, 0, 1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 7;
    got = count_distinct_special_words(7, [0, 1, 0, 1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
