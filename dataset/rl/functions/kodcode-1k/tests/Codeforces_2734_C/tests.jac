import from main { longest_increasing_segment }

test "case 0" {
    want = 2;
    got = longest_increasing_segment(6, [2, 1, 3, 2, 1, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_increasing_segment(4, [1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = longest_increasing_segment(5, [5, 4, 3, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = longest_increasing_segment(1, [1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = longest_increasing_segment(7, [1, 3, 5, 4, 6, 8, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_increasing_segment(0, []);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = longest_increasing_segment(8, [5, 5, 5, 5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
