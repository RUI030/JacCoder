import from main { longest_consecutive_sequence }

test "case 0" {
    want = 6;
    got = longest_consecutive_sequence([2, 6, 1, 9, 4, 5, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 3;
    got = longest_consecutive_sequence([1, 2, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = longest_consecutive_sequence([10, 5, 12, 3, 55, 30, 4, 11, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 4;
    got = longest_consecutive_sequence([100, 4, 200, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_consecutive_sequence([10, 20, 30, 40]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_consecutive_sequence([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_consecutive_sequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = longest_consecutive_sequence([100, 101, 102, 103, 104]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = longest_consecutive_sequence([1, 3, 5, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = 9;
    got = longest_consecutive_sequence([9, 1, 4, 7, 3, 8, 5, 2, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
