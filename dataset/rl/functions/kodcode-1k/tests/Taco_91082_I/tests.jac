import from main { longest_consecutive_sequence }

test "case 0" {
    want = 4;
    got = longest_consecutive_sequence([100, 4, 200, 1, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = longest_consecutive_sequence([1, 2, 3, 4, 100, 200, 300]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = longest_consecutive_sequence([100, 200, 300, 1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = longest_consecutive_sequence([50, 51, 52, 100, 200, 201, 202]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = longest_consecutive_sequence([10, 20, 30, 40, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = longest_consecutive_sequence([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = longest_consecutive_sequence([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 5;
    got = longest_consecutive_sequence([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 4;
    got = longest_consecutive_sequence([1, 2, 2, 3, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
