import from main { max_decreasing_length }

test "case 0" {
    want = 4;
    got = max_decreasing_length(6, [4, 4, 2, 2, 3, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 5;
    got = max_decreasing_length(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = max_decreasing_length(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = max_decreasing_length(4, [4, 3, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = max_decreasing_length(1, [10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 3;
    got = max_decreasing_length(6, [8, 7, 6, 7, 6, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 7;
    got = max_decreasing_length(7, [7, 7, 6, 6, 6, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 4;
    got = max_decreasing_length(4, [3, 2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
