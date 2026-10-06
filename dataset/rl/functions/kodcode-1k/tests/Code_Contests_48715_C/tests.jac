import from main { longest_consecutive_sequence }

test "case 0" {
    want = 5;
    got = longest_consecutive_sequence([100, 4, 200, 1, 3, 2, 102, 101, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_consecutive_sequence([0, 3, 7, 2, 5, 8, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 3;
    got = longest_consecutive_sequence([1, 2, 0, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 6;
    got = longest_consecutive_sequence([9, 1, -1, 8, 7, 10, 11, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 5;
    got = longest_consecutive_sequence([1, 3, 5, 2, 4, 9, 10, 8]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 1;
    got = longest_consecutive_sequence([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 0;
    got = longest_consecutive_sequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = longest_consecutive_sequence([10, 5, 15, 20, 25]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
